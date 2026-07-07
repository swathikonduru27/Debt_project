-- ============================================================================
-- PAYMENTS DML - Insert Payment Records
-- ============================================================================
-- Based on notes in the original data about specific payments made
-- ============================================================================

-- Jyotheeswar → Shiva: Payment of 90k interest (Jun 1, 2026)
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Shiva'), 90000.00, '2026-06-01', '90k interest paid on june 1st for last 6 months'
FROM debts d
WHERE d.principal_amount = 1000000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar')
LIMIT 1;

-- Ramesh → Shiva: Payment of 90k interest (Jun 1, 2026)
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Shiva'), 90000.00, '2026-06-01', 'Interest 90k paid on June 1st, 2026'
FROM debts d
WHERE d.principal_amount = 1000000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Ramesh')
LIMIT 1;

-- Lokesh → Shiva: Payment of 285k interest (Mar 17, 2026)
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Shiva'), 285000.00, '2026-03-17', 'Paid 285000 interest on march 17th'
FROM debts d
WHERE d.principal_amount = 1550000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh')
LIMIT 1;

-- Naveen Friend → Shiva: Payment of 180k (May 31, 2026)
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Shiva'), 180000.00, '2026-05-31', 'Paid interest on May31, 2026. 1.8L (paid through shiva)'
FROM debts d
WHERE d.principal_amount = 1500000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Naveen Friend')
LIMIT 1;

-- Deepa → Sandhya: Payment of 350k principal + 10k interest (May 19, 2026)
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Sandhya Konduru'), 360000.00, '2026-05-19', 'Interest 10k paid along with 350k principal amount. 3.5L paid on May 19th, 2026'
FROM debts d
WHERE d.principal_amount = 500000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Sandhya Konduru')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa')
LIMIT 1;

-- Ramapuram → Venkata: Payment of 1000k principal (April 1st week, 2026)
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 1000000.00, '2026-04-05', 'Interest paid in Jan. 10L paid off in April 1st week. 5L remaining'
FROM debts d
WHERE d.principal_amount = 1500000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Ramapuram')
LIMIT 1;

-- Uthukota → Venkata: Payment of 400k (200k already sent + 200k on July 1st week)
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 200000.00, '2026-07-05', 'Dad sent 2L. But interest outstanding since 1 year. I sent 2L on July 1st week'
FROM debts d
WHERE d.principal_amount = 2000000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Uthukota')
LIMIT 1;

-- Naveen → Shiva: Partial payments (Cleared status but 360k remaining noted)
-- This debt is cleared but with payments made over time - creating sample payment
INSERT INTO payments (debt_id, paid_by, amount_paid, payment_date, notes)
SELECT d.debt_id, (SELECT user_id FROM users WHERE name = 'Shiva'), 3640000.00, '2026-04-05', 'Paid off 40L in April 1st week. Interest amount pending'
FROM debts d
WHERE d.principal_amount = 4000000
AND d.borrower_id = (SELECT user_id FROM users WHERE name = 'Shiva')
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Naveen')
LIMIT 1;
