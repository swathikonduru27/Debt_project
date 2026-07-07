-- ============================================================================
-- INTEREST_SCHEDULE DML - Insert Interest Accrual Periods
-- ============================================================================
-- Note: Creating sample periods for debts with clear dates and frequencies
-- ============================================================================

-- Sandeep → Shiva: 250,000 at 1.5% Quarterly (Mar 20, 2024 - Feb 1, 2026)
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 1, '2024-03-20', '2024-06-19', '2024-06-19', 3750.00, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 2, '2024-06-20', '2024-09-19', '2024-09-19', 3750.00, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 3, '2024-09-20', '2024-12-19', '2024-12-19', 3750.00, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 4, '2024-12-20', '2025-03-19', '2025-03-19', 3750.00, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 5, '2025-03-20', '2025-06-19', '2025-06-19', 3750.00, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 6, '2025-06-20', '2025-09-19', '2025-09-19', 3750.00, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 7, '2025-09-20', '2025-12-19', '2025-12-19', 3750.00, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 8, '2025-12-20', '2026-02-01', '2026-02-01', 2062.50, 'paid' FROM debts WHERE principal_amount = 250000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') LIMIT 1;

-- Lokesh Friend → Shiva: 650,000 at 1.5% Half Yearly (Mar 21, 2024 - Jun 2025)
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 1, '2024-03-21', '2024-09-20', '2024-09-20', 4875.00, 'paid' FROM debts WHERE principal_amount = 650000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh Friend') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 2, '2024-09-21', '2025-03-20', '2025-03-20', 4875.00, 'paid' FROM debts WHERE principal_amount = 650000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh Friend') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 3, '2025-03-21', '2025-06-30', '2025-06-30', 2968.75, 'paid' FROM debts WHERE principal_amount = 650000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh Friend') LIMIT 1;

-- Aravindha → Shiva: 1,000,000 at 1.25% Quarterly (Feb 11, 2023 - Dec 1, 2024)
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 1, '2023-02-11', '2023-05-10', '2023-05-10', 3125.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 2, '2023-05-11', '2023-08-09', '2023-08-09', 3125.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 3, '2023-08-10', '2023-11-08', '2023-11-08', 3125.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 4, '2023-11-09', '2024-02-07', '2024-02-07', 3125.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 5, '2024-02-08', '2024-05-08', '2024-05-08', 3125.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 6, '2024-05-09', '2024-08-07', '2024-08-07', 3125.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 7, '2024-08-08', '2024-11-06', '2024-11-06', 3125.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 8, '2024-11-07', '2024-12-01', '2024-12-01', 1510.42, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Aravindha') LIMIT 1;

-- Jyotheeswar → Shiva: 1,000,000 at 1.5% Quarterly (Sep 25, 2023 - Active)
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 1, '2023-09-25', '2023-12-24', '2023-12-24', 3750.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 2, '2023-12-25', '2024-03-24', '2024-03-24', 3750.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 3, '2024-03-25', '2024-06-23', '2024-06-23', 3750.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 4, '2024-06-24', '2024-09-23', '2024-09-23', 3750.00, 'paid' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 5, '2024-09-24', '2024-12-23', '2024-12-23', 3750.00, 'pending' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 6, '2024-12-24', '2025-03-25', '2025-03-25', 3750.00, 'pending' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 7, '2025-03-26', '2025-06-24', '2025-06-24', 3750.00, 'pending' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 8, '2025-06-25', '2025-09-23', '2025-09-23', 3750.00, 'pending' FROM debts WHERE principal_amount = 1000000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1;

-- Naveen Friend → Shiva: 1,500,000 at 2% Half Yearly (Nov 15, 2024 - Active)
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 1, '2024-11-15', '2025-05-14', '2025-05-14', 15000.00, 'pending' FROM debts WHERE principal_amount = 1500000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Naveen Friend') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 2, '2025-05-15', '2025-11-14', '2025-11-14', 15000.00, 'pending' FROM debts WHERE principal_amount = 1500000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Naveen Friend') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 3, '2025-11-15', '2026-05-14', '2026-05-14', 15000.00, 'pending' FROM debts WHERE principal_amount = 1500000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Naveen Friend') LIMIT 1;

-- Lokesh → Shiva: 1,550,000 at 1.25% Half Yearly (May 10, 2024 - Active)
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 1, '2024-05-10', '2024-11-09', '2024-11-09', 9687.50, 'pending' FROM debts WHERE principal_amount = 1550000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 2, '2024-11-10', '2025-05-09', '2025-05-09', 9687.50, 'pending' FROM debts WHERE principal_amount = 1550000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 3, '2025-05-10', '2025-11-09', '2025-11-09', 9687.50, 'pending' FROM debts WHERE principal_amount = 1550000 AND borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva') AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh') LIMIT 1;

-- Deepa → Sandhya: 500,000 at 2% Monthly (Active)
-- Sample: 6 months of periods
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 1, '2026-01-01', '2026-01-31', '2026-01-31', 833.33, 'paid' FROM debts WHERE principal_amount = 500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 2, '2026-02-01', '2026-02-28', '2026-02-28', 833.33, 'paid' FROM debts WHERE principal_amount = 500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 3, '2026-03-01', '2026-03-31', '2026-03-31', 833.33, 'paid' FROM debts WHERE principal_amount = 500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 4, '2026-04-01', '2026-04-30', '2026-04-30', 833.33, 'paid' FROM debts WHERE principal_amount = 500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 5, '2026-05-01', '2026-05-19', '2026-05-19', 319.44, 'paid' FROM debts WHERE principal_amount = 500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa') LIMIT 1;
INSERT INTO interest_schedule (debt_id, period_number, period_start, period_end, due_date, amount_due, status)
SELECT debt_id, 6, '2026-05-20', '2026-06-30', '2026-06-30', 1046.67, 'pending' FROM debts WHERE principal_amount = 500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa') LIMIT 1;
