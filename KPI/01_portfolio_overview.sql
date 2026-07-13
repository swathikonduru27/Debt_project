-- ============================================================================
-- PORTFOLIO OVERVIEW KPIs
-- ============================================================================
-- Macro-level metrics for the entire debt portfolio
-- ============================================================================

-- KPI 1.1: Total Portfolio Summary
SELECT
    COUNT(DISTINCT CASE WHEN status = 'active' THEN debt_id END) as total_active_debts,
    SUM(principal_amount) as total_debt,
    SUM(CASE WHEN status = 'active' THEN principal_remaining ELSE 0 END) as active_principal,
    SUM(CASE WHEN status = 'cleared' THEN principal_amount ELSE 0 END) as total_principal_cleared,
    COUNT(DISTINCT borrower_id) as unique_borrowers,
    COUNT(DISTINCT lender_id) as unique_lenders,
    AVG(interest_rate) as avg_interest_rate,
    ROUND(100.0 * COUNT(CASE WHEN status = 'cleared' THEN 1 END) / NULLIF(COUNT(*), 0), 2) as percent_debts_fully_repaid
FROM finances.debts;


-- KPI 1.2: Debt Status Breakdown
SELECT
    status,
    COUNT(*) as debt_count,
    SUM(CASE WHEN status = 'cleared' THEN principal_amount ELSE principal_remaining END) as principal_amount,
    ROUND(100.0 * COUNT(*) / NULLIF((SELECT COUNT(*) FROM finances.debts), 0), 2) as percent_of_total
FROM finances.debts
GROUP BY status
ORDER BY debt_count DESC;


-- KPI 1.3: Interest Rate Distribution
SELECT
    interest_rate,
    COUNT(*) as debt_count,
    SUM(principal_remaining) as total_principal,
    ROUND(100.0 * SUM(principal_remaining) / NULLIF(
        (SELECT SUM(principal_remaining) FROM finances.debts WHERE status = 'active'), 0
    ), 2) as percent_of_active_principal
FROM finances.debts
WHERE status = 'active' AND interest_rate IS NOT NULL
GROUP BY interest_rate
ORDER BY interest_rate DESC;


-- KPI 1.4: Current Month Pending Interest by Debt
SELECT
    d.debt_id,
    u.name as borrower,
    l.name as lender,
    d.interest_frequency,
    i.amount_due,
    i.due_date,
    CASE WHEN i.status = 'pending' AND i.due_date <= CURRENT_DATE THEN 'OVERDUE'
         WHEN i.status = 'pending' THEN 'PENDING'
         ELSE i.status
    END as payment_status
FROM finances.interest_schedule i
JOIN finances.debts d ON i.debt_id = d.debt_id
JOIN finances.users u ON d.borrower_id = u.user_id
JOIN finances.lenders l ON d.lender_id = l.lender_id
WHERE i.status IN ('pending', 'overdue')
ORDER BY payment_status, i.due_date;
