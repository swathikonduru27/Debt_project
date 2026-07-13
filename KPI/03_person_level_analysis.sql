-- ============================================================================
-- PERSON-LEVEL ANALYSIS KPIs
-- ============================================================================
-- Metrics broken down by borrower and lender
-- ============================================================================

-- KPI 3.1: Borrower Debt Summary
SELECT
    u.user_id,
    u.name,
    COUNT(DISTINCT d.debt_id) as total_debts,
    COUNT(DISTINCT CASE WHEN d.status = 'active' THEN d.debt_id END) as active_debts,
    SUM(d.principal_remaining) as total_principal_outstanding,
    SUM(CASE WHEN d.status = 'active' THEN d.principal_remaining ELSE 0 END) as active_principal,
    ROUND(AVG(CASE WHEN d.interest_rate IS NOT NULL THEN d.interest_rate END), 2) as avg_interest_rate,
    SUM(p.amount_paid) as total_paid,
    COUNT(p.payment_id) as payment_count,
    MAX(p.payment_date) as last_payment_date
FROM finances.users u
LEFT JOIN finances.debts d ON u.user_id = d.borrower_id
LEFT JOIN finances.payments p ON u.user_id = p.paid_by
GROUP BY u.user_id, u.name
ORDER BY total_principal_outstanding DESC NULLS LAST;


-- KPI 3.2: Lender Exposure Analysis
SELECT
    l.lender_id,
    l.name,
    l.relationship_type,
    COUNT(DISTINCT d.debt_id) as total_debts,
    COUNT(DISTINCT CASE WHEN d.status = 'active' THEN d.debt_id END) as active_debts,
    SUM(d.principal_amount) as total_principal_loaned,
    SUM(d.principal_remaining) as total_principal_outstanding,
    ROUND(100.0 * SUM(d.principal_amount - d.principal_remaining) / NULLIF(SUM(d.principal_amount), 0), 2) as pct_repaid,
    SUM(p.amount_paid) as total_paid_received,
    COUNT(p.payment_id) as payment_count
FROM finances.lenders l
LEFT JOIN finances.debts d ON l.lender_id = d.lender_id
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
GROUP BY l.lender_id, l.name, l.relationship_type
ORDER BY total_principal_outstanding DESC NULLS LAST;


-- KPI 3.3: Borrower-Lender Relationship Matrix
SELECT
    u.name as borrower,
    l.name as lender,
    COUNT(DISTINCT d.debt_id) as debt_count,
    SUM(d.principal_remaining) as outstanding_principal,
    SUM(d.principal_amount - d.principal_remaining) as amount_repaid,
    ROUND(AVG(d.interest_rate), 2) as avg_interest_rate,
    MAX(p.payment_date) as last_payment_date
FROM finances.debts d
JOIN finances.users u ON d.borrower_id = u.user_id
JOIN finances.lenders l ON d.lender_id = l.lender_id
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
GROUP BY u.name, l.name
ORDER BY outstanding_principal DESC;


-- KPI 3.4: Borrower Payment Contribution
SELECT
    u.user_id,
    u.name,
    COUNT(DISTINCT p.payment_id) as payment_count,
    SUM(p.amount_paid) as total_amount_paid,
    ROUND(100.0 * SUM(p.amount_paid) / NULLIF((SELECT SUM(amount_paid) FROM finances.payments), 0), 2) as pct_of_all_payments,
    ROUND(AVG(p.amount_paid), 2) as avg_payment_size,
    MIN(p.payment_date) as first_payment_date,
    MAX(p.payment_date) as most_recent_payment
FROM finances.users u
LEFT JOIN finances.payments p ON u.user_id = p.paid_by
GROUP BY u.user_id, u.name
ORDER BY total_amount_paid DESC NULLS LAST;


-- KPI 3.5: Lender Collections Summary
SELECT
    l.lender_id,
    l.name,
    SUM(d.principal_amount) as total_lent,
    SUM(p.amount_paid) as total_collected,
    SUM(d.principal_remaining) as still_outstanding,
    ROUND(100.0 * SUM(p.amount_paid) / NULLIF(SUM(d.principal_amount), 0), 2) as pct_collected,
    COUNT(DISTINCT CASE WHEN d.status = 'paid_off' THEN d.debt_id END) as fully_paid_debts,
    COUNT(DISTINCT CASE WHEN d.status = 'active' THEN d.debt_id END) as active_debts
FROM finances.lenders l
LEFT JOIN finances.debts d ON l.lender_id = d.lender_id
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
GROUP BY l.lender_id, l.name
ORDER BY total_outstanding DESC NULLS LAST;


-- KPI 3.6: High-Risk Borrowers (by payment health)
SELECT
    u.user_id,
    u.name,
    COUNT(DISTINCT d.debt_id) as active_debts,
    SUM(d.principal_remaining) as total_outstanding,
    CURRENT_DATE - MAX(p.payment_date) as days_since_last_payment,
    COUNT(DISTINCT CASE WHEN i.due_date < CURRENT_DATE AND i.status != 'paid' THEN i.schedule_id END) as overdue_interest_periods,
    CASE
        WHEN CURRENT_DATE - MAX(p.payment_date) > 90 THEN 'High Risk'
        WHEN CURRENT_DATE - MAX(p.payment_date) > 60 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END as risk_level
FROM finances.users u
JOIN finances.debts d ON u.user_id = d.borrower_id AND d.status = 'active'
LEFT JOIN finances.payments p ON d.debt_id = p.debt_id
LEFT JOIN finances.interest_schedule i ON d.debt_id = i.debt_id
GROUP BY u.user_id, u.name
HAVING CURRENT_DATE - MAX(p.payment_date) > 60 OR COUNT(DISTINCT CASE WHEN i.due_date < CURRENT_DATE AND i.status != 'paid' THEN i.schedule_id END) > 0
ORDER BY days_since_last_payment DESC NULLS LAST;
