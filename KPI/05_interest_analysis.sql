-- ============================================================================
-- INTEREST ANALYSIS KPIs
-- ============================================================================
-- Interest accrual, collection, and trends by time period
-- ============================================================================

-- KPI 5.1: Interest by Month (Historical & Projected)
SELECT
    DATE_TRUNC('month', i.due_date)::DATE as interest_month,
    COUNT(*) as interest_periods,
    SUM(i.amount_due) as total_interest_due,
    SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) as paid,
    SUM(CASE WHEN i.status = 'pending' THEN i.amount_due ELSE 0 END) as pending,
    SUM(CASE WHEN i.status = 'overdue' THEN i.amount_due ELSE 0 END) as overdue,
    ROUND(100.0 * SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) / NULLIF(SUM(i.amount_due), 0), 2) as pct_collected,
    CASE
        WHEN DATE_TRUNC('month', i.due_date)::DATE <= DATE_TRUNC('month', CURRENT_DATE)::DATE THEN 'Historical'
        ELSE 'Projected'
    END as period_type
FROM finances.interest_schedule i
GROUP BY DATE_TRUNC('month', i.due_date)
ORDER BY interest_month DESC;


-- KPI 5.2: Interest by Month and Borrower
SELECT
    DATE_TRUNC('month', i.due_date)::DATE as interest_month,
    u.name as borrower,
    COUNT(*) as interest_periods,
    SUM(i.amount_due) as total_due,
    SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) as paid,
    SUM(CASE WHEN i.status = 'pending' THEN i.amount_due ELSE 0 END) as pending,
    SUM(CASE WHEN i.status = 'overdue' THEN i.amount_due ELSE 0 END) as overdue
FROM finances.interest_schedule i
JOIN finances.debts d ON i.debt_id = d.debt_id
JOIN finances.users u ON d.borrower_id = u.user_id
GROUP BY DATE_TRUNC('month', i.due_date), u.name
ORDER BY interest_month DESC, borrower;


-- KPI 5.3: Interest by Month and Lender
SELECT
    DATE_TRUNC('month', i.due_date)::DATE as interest_month,
    l.name as lender,
    COUNT(*) as interest_periods,
    SUM(i.amount_due) as total_due,
    SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) as paid,
    SUM(CASE WHEN i.status = 'pending' THEN i.amount_due ELSE 0 END) as pending,
    SUM(CASE WHEN i.status = 'overdue' THEN i.amount_due ELSE 0 END) as overdue
FROM finances.interest_schedule i
JOIN finances.debts d ON i.debt_id = d.debt_id
JOIN finances.lenders l ON d.lender_id = l.lender_id
GROUP BY DATE_TRUNC('month', i.due_date), l.name
ORDER BY interest_month DESC, lender;


-- KPI 5.4: Total Interest Generated vs Collected (Cumulative)
SELECT
    DATE_TRUNC('month', i.due_date)::DATE as month,
    SUM(i.amount_due) as interest_accrued,
    SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) as interest_collected,
    SUM(CASE WHEN i.status IN ('pending', 'overdue') THEN i.amount_due ELSE 0 END) as interest_outstanding,
    ROUND(100.0 * SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) / NULLIF(SUM(i.amount_due), 0), 2) as collection_rate,
    SUM(SUM(i.amount_due)) OVER (ORDER BY DATE_TRUNC('month', i.due_date)) as cumulative_interest_accrued,
    SUM(SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END)) OVER (ORDER BY DATE_TRUNC('month', i.due_date)) as cumulative_collected
FROM finances.interest_schedule i
GROUP BY DATE_TRUNC('month', i.due_date)
ORDER BY month DESC;


-- KPI 5.5: Interest Breakdown by Debt (Top Debtors)
SELECT
    d.debt_id,
    u.name as borrower,
    l.name as lender,
    d.principal_remaining,
    d.interest_rate,
    COUNT(i.schedule_id) as interest_periods_total,
    SUM(i.amount_due) as total_interest_due,
    SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) as interest_paid,
    SUM(CASE WHEN i.status IN ('pending', 'overdue') THEN i.amount_due ELSE 0 END) as interest_outstanding,
    ROUND(100.0 * SUM(CASE WHEN i.status = 'paid' THEN i.amount_due ELSE 0 END) / NULLIF(SUM(i.amount_due), 0), 2) as pct_interest_paid
FROM finances.debts d
JOIN finances.users u ON d.borrower_id = u.user_id
JOIN finances.lenders l ON d.lender_id = l.lender_id
LEFT JOIN finances.interest_schedule i ON d.debt_id = i.debt_id
WHERE d.status = 'active'
GROUP BY d.debt_id, u.name, l.name, d.principal_remaining, d.interest_rate
ORDER BY total_interest_due DESC;


-- KPI 5.6: Overdue Interest Analysis (by Month and Borrower)
SELECT
    DATE_TRUNC('month', i.due_date)::DATE as due_month,
    u.name as borrower,
    l.name as lender,
    COUNT(DISTINCT i.schedule_id) as overdue_periods,
    SUM(i.amount_due) as overdue_amount,
    CURRENT_DATE - i.due_date as days_overdue,
    MAX(i.due_date) as earliest_due_date
FROM finances.interest_schedule i
JOIN finances.debts d ON i.debt_id = d.debt_id
JOIN finances.users u ON d.borrower_id = u.user_id
JOIN finances.lenders l ON d.lender_id = l.lender_id
WHERE i.status = 'overdue' AND i.due_date < CURRENT_DATE
GROUP BY DATE_TRUNC('month', i.due_date), u.name, l.name, i.due_date
ORDER BY due_month, borrower;


-- KPI 5.7: Monthly Interest Projection (next 6 months)
SELECT
    DATE_TRUNC('month', i.due_date)::DATE as projected_month,
    COUNT(*) as interest_periods_due,
    SUM(i.amount_due) as projected_interest_due,
    COUNT(DISTINCT d.debt_id) as debts_with_interest
FROM finances.interest_schedule i
JOIN finances.debts d ON i.debt_id = d.debt_id
WHERE i.due_date > CURRENT_DATE
    AND i.due_date <= CURRENT_DATE + INTERVAL '6 months'
    AND d.status = 'active'
GROUP BY DATE_TRUNC('month', i.due_date)
ORDER BY projected_month;


-- KPI 5.8: Interest Rate Analysis (Impact on Monthly Interest)
SELECT
    ROUND(d.interest_rate, 0) as interest_rate_bucket,
    COUNT(DISTINCT d.debt_id) as debt_count,
    SUM(d.principal_remaining) as total_principal,
    SUM(i.amount_due) / NULLIF(COUNT(DISTINCT d.debt_id), 0) as avg_interest_per_debt,
    SUM(i.amount_due) as total_interest_due
FROM finances.debts d
LEFT JOIN finances.interest_schedule i ON d.debt_id = i.debt_id
    AND i.due_date > CURRENT_DATE
    AND i.due_date <= CURRENT_DATE + INTERVAL '1 month'
WHERE d.status = 'active'
GROUP BY ROUND(d.interest_rate, 0)
ORDER BY interest_rate_bucket DESC;
