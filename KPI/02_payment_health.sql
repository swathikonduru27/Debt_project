-- ============================================================================
-- PAYMENT HEALTH KPIs
-- ============================================================================
-- Metrics for payment performance and velocity
-- ============================================================================

-- KPI 2.1: Overall Payment Metrics
SELECT
    COUNT(DISTINCT debt_id) as debts_with_payments,
    COUNT(*) as total_payments_made,
    SUM(amount_paid) as total_amount_paid,
    ROUND(AVG(amount_paid), 2) as avg_payment_amount,
    MAX(payment_date) as last_payment_date,
    ROUND(100.0 * COUNT(CASE WHEN payment_date >= CURRENT_DATE - INTERVAL '30 days' THEN 1 END) / NULLIF(COUNT(*), 0), 2) as pct_payments_last_30_days
FROM finances.payments;


-- KPI 2.2: Payment Velocity (Monthly Trends)
SELECT
    DATE_TRUNC('month', payment_date)::DATE as payment_month,
    COUNT(*) as payment_count,
    SUM(amount_paid) as total_paid,
    COUNT(DISTINCT debt_id) as debts_paid,
    ROUND(AVG(amount_paid), 2) as avg_payment
FROM finances.payments
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY payment_month DESC;


-- KPI 2.3: Payment Timeliness - Interest Schedule vs Payments
SELECT
    COUNT(DISTINCT i.schedule_id) as total_interest_periods,
    SUM(CASE WHEN i.status = 'paid' THEN 1 ELSE 0 END) as paid_periods,
    SUM(CASE WHEN i.status = 'pending' THEN 1 ELSE 0 END) as pending_periods,
    SUM(CASE WHEN i.status = 'overdue' AND i.due_date < CURRENT_DATE THEN 1 ELSE 0 END) as overdue_periods,
    ROUND(100.0 * SUM(CASE WHEN i.status = 'paid' THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) as pct_on_time
FROM finances.interest_schedule i
WHERE i.period_end <= CURRENT_DATE;


-- KPI 2.4: Debts with Missing/Late Payments
SELECT
    d.debt_id,
    u.name as borrower,
    l.name as lender,
    d.principal_remaining,
    d.interest_rate,
    MAX(p.payment_date) as last_payment_date,
    CURRENT_DATE - MAX(p.payment_date) as days_since_payment,
    COUNT(DISTINCT CASE WHEN i.due_date < CURRENT_DATE AND i.status != 'paid' THEN i.schedule_id END) as overdue_interest_periods
FROM finances.debts d
LEFT JOIN finances.users u ON d.borrower_id = u.user_id
LEFT JOIN finances.lenders l ON d.lender_id = l.lender_id
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
LEFT JOIN finances.interest_schedule i ON d.debt_id = i.debt_id
WHERE d.status = 'active'
GROUP BY d.debt_id, u.name, l.name, d.principal_remaining, d.interest_rate
HAVING CURRENT_DATE - MAX(p.payment_date) > 60 OR COUNT(DISTINCT CASE WHEN i.due_date < CURRENT_DATE AND i.status != 'paid' THEN i.schedule_id END) > 0
ORDER BY days_since_payment DESC NULLS LAST;


-- KPI 2.5: Payment Allocation Analysis (by debt)
SELECT
    d.debt_id,
    u.name as borrower,
    l.name as lender,
    d.principal_amount,
    d.principal_remaining,
    SUM(p.amount_paid) as total_paid_to_date,
    ROUND(100.0 * SUM(p.amount_paid) / NULLIF(d.principal_amount, 0), 2) as pct_principal_paid,
    COUNT(p.payment_id) as payment_count,
    ROUND(AVG(p.amount_paid), 2) as avg_payment_size,
    MAX(p.payment_date) as last_payment_date
FROM finances.debts d
LEFT JOIN finances.users u ON d.borrower_id = u.user_id
LEFT JOIN finances.lenders l ON d.lender_id = l.lender_id
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
WHERE d.status = 'active'
GROUP BY d.debt_id, u.name, l.name, d.principal_amount, d.principal_remaining
ORDER BY total_paid_to_date DESC NULLS LAST;


-- KPI 2.6: Payment Consistency Score (last 6 months)
SELECT
    u.user_id,
    u.name,
    COUNT(DISTINCT DATE_TRUNC('month', p.payment_date)) as months_with_payments,
    COUNT(p.payment_id) as total_payments,
    SUM(p.amount_paid) as total_amount,
    ROUND(AVG(p.amount_paid), 2) as avg_payment,
    CASE
        WHEN COUNT(DISTINCT DATE_TRUNC('month', p.payment_date)) >= 5 THEN 'Excellent'
        WHEN COUNT(DISTINCT DATE_TRUNC('month', p.payment_date)) >= 3 THEN 'Good'
        WHEN COUNT(DISTINCT DATE_TRUNC('month', p.payment_date)) >= 1 THEN 'Fair'
        ELSE 'No payments'
    END as payment_consistency
FROM finances.users u
LEFT JOIN finances.payments p ON u.user_id = p.paid_by
    AND p.payment_date >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY u.user_id, u.name
ORDER BY months_with_payments DESC;
