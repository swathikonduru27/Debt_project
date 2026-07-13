-- ============================================================================
-- PAYOFF PROJECTIONS KPIs
-- ============================================================================
-- Estimated timelines and at-risk debt analysis
-- ============================================================================

-- KPI 4.1: Debt Payoff Projection (based on 6-month payment velocity)
WITH payment_velocity AS (
    SELECT
        d.debt_id,
        d.principal_remaining,
        SUM(CASE WHEN p.payment_date >= CURRENT_DATE - INTERVAL '6 months' THEN p.amount_paid ELSE 0 END) as paid_last_6_months,
        ROUND(SUM(CASE WHEN p.payment_date >= CURRENT_DATE - INTERVAL '6 months' THEN p.amount_paid ELSE 0 END) / 6.0, 2) as avg_monthly_payment
    FROM finances.debts d
    LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
    WHERE d.status = 'active'
    GROUP BY d.debt_id, d.principal_remaining
)
SELECT
    d.debt_id,
    u.name as borrower,
    l.name as lender,
    d.principal_remaining,
    pv.avg_monthly_payment,
    CASE
        WHEN pv.avg_monthly_payment > 0 THEN CEILING(d.principal_remaining / pv.avg_monthly_payment)
        ELSE NULL
    END as months_to_payoff,
    CASE
        WHEN pv.avg_monthly_payment > 0 THEN (CURRENT_DATE + (CEILING(d.principal_remaining / pv.avg_monthly_payment) || ' months')::INTERVAL)::DATE
        ELSE NULL
    END as estimated_payoff_date,
    CASE
        WHEN pv.avg_monthly_payment <= 0 THEN 'No recent payments'
        WHEN CEILING(d.principal_remaining / pv.avg_monthly_payment) > 60 THEN 'At Risk (>5 years)'
        WHEN CEILING(d.principal_remaining / pv.avg_monthly_payment) > 24 THEN 'Extended Timeline (2-5 years)'
        ELSE 'On Track'
    END as payoff_status
FROM finances.debts d
JOIN finances.users u ON d.borrower_id = u.user_id
JOIN finances.lenders l ON d.lender_id = l.lender_id
JOIN payment_velocity pv ON d.debt_id = pv.debt_id
ORDER BY months_to_payoff DESC NULLS LAST;


-- KPI 4.2: At-Risk Debts (low payment activity)
SELECT
    d.debt_id,
    u.name as borrower,
    l.name as lender,
    d.principal_remaining,
    COALESCE(CURRENT_DATE - MAX(p.payment_date), 999) as days_since_last_payment,
    COUNT(DISTINCT CASE WHEN p.payment_date >= CURRENT_DATE - INTERVAL '6 months' THEN p.payment_id END) as payments_last_6m,
    COUNT(DISTINCT CASE WHEN i.due_date < CURRENT_DATE AND i.status = 'overdue' THEN i.schedule_id END) as overdue_interest_periods,
    CASE
        WHEN COUNT(DISTINCT CASE WHEN p.payment_date >= CURRENT_DATE - INTERVAL '6 months' THEN p.payment_id END) = 0 THEN 'Critical'
        WHEN COALESCE(CURRENT_DATE - MAX(p.payment_date), 999) > 90 THEN 'High'
        WHEN COUNT(DISTINCT CASE WHEN i.due_date < CURRENT_DATE AND i.status = 'overdue' THEN i.schedule_id END) > 0 THEN 'Medium'
        ELSE 'Low'
    END as risk_level
FROM finances.debts d
JOIN finances.users u ON d.borrower_id = u.user_id
JOIN finances.lenders l ON d.lender_id = l.lender_id
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
LEFT JOIN finances.interest_schedule i ON d.debt_id = i.debt_id
WHERE d.status = 'active'
GROUP BY d.debt_id, u.name, l.name, d.principal_remaining
HAVING COUNT(DISTINCT CASE WHEN p.payment_date >= CURRENT_DATE - INTERVAL '6 months' THEN p.payment_id END) = 0
   OR COALESCE(CURRENT_DATE - MAX(p.payment_date), 999) > 90
ORDER BY risk_level, days_since_last_payment DESC NULLS LAST;


-- KPI 4.3: Debt Payoff Summary by Borrower
SELECT
    u.user_id,
    u.name,
    COUNT(DISTINCT d.debt_id) as total_active_debts,
    SUM(d.principal_remaining) as total_outstanding,
    ROUND(AVG(CEILING(d.principal_remaining / NULLIF(
        SUM(CASE WHEN p.payment_date >= CURRENT_DATE - INTERVAL '6 months' THEN p.amount_paid ELSE 0 END) / 6.0, 0)
    )), 0) as avg_months_to_payoff,
    CASE
        WHEN COUNT(d.debt_id) > 0 AND AVG(CEILING(d.principal_remaining / NULLIF(
            SUM(CASE WHEN p.payment_date >= CURRENT_DATE - INTERVAL '6 months' THEN p.amount_paid ELSE 0 END) / 6.0, 0)
        )) > 60 THEN 'Extended'
        WHEN COUNT(d.debt_id) > 0 THEN 'On Track'
        ELSE 'No Debts'
    END as overall_payoff_health
FROM finances.users u
LEFT JOIN finances.debts d ON u.user_id = d.borrower_id AND d.status = 'active'
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
GROUP BY u.user_id, u.name
ORDER BY total_outstanding DESC NULLS LAST;


-- KPI 4.4: Interest Burden Projection (next 12 months)
WITH future_interest AS (
    SELECT
        d.debt_id,
        u.name as borrower,
        l.name as lender,
        SUM(i.amount_due) as projected_12m_interest
    FROM finances.debts d
    JOIN finances.users u ON d.borrower_id = u.user_id
    JOIN finances.lenders l ON d.lender_id = l.lender_id
    LEFT JOIN finances.interest_schedule i ON d.debt_id = i.debt_id
        AND i.due_date > CURRENT_DATE
        AND i.due_date <= CURRENT_DATE + INTERVAL '12 months'
    WHERE d.status = 'active'
    GROUP BY d.debt_id, u.name, l.name
)
SELECT
    debt_id,
    borrower,
    lender,
    COALESCE(projected_12m_interest, 0) as interest_due_next_12m
FROM future_interest
WHERE projected_12m_interest > 0
ORDER BY projected_12m_interest DESC;


-- KPI 4.5: Debts by Completion Stage
SELECT
    CASE
        WHEN d.principal_remaining / NULLIF(d.principal_amount, 1) >= 0.75 THEN 'Just Started (0-25% paid)'
        WHEN d.principal_remaining / NULLIF(d.principal_amount, 1) >= 0.5 THEN 'Early Stage (25-50% paid)'
        WHEN d.principal_remaining / NULLIF(d.principal_amount, 1) >= 0.25 THEN 'Mid Stage (50-75% paid)'
        ELSE 'Final Stage (75%+ paid)'
    END as repayment_stage,
    COUNT(*) as debt_count,
    SUM(d.principal_remaining) as outstanding_principal,
    ROUND(AVG(d.interest_rate), 2) as avg_interest_rate
FROM finances.debts d
WHERE d.status = 'active'
GROUP BY repayment_stage
ORDER BY
    CASE
        WHEN repayment_stage = 'Just Started (0-25% paid)' THEN 1
        WHEN repayment_stage = 'Early Stage (25-50% paid)' THEN 2
        WHEN repayment_stage = 'Mid Stage (50-75% paid)' THEN 3
        ELSE 4
    END;
