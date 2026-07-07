-- ============================================================================
-- DEBTS DML - Insert All Debt Records
-- ============================================================================
-- CLEARED DEBTS
-- ============================================================================

-- Sandeep lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Sandeep'), (SELECT user_id FROM users WHERE name = 'Shiva'), 250000.00, 0.00, 1.50, 'quarterly', '2024-03-20', 'INR', 'cleared', 'Cleared with interest');

-- Unknown lent to Sandhya (Sandy)
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Unknown'), (SELECT user_id FROM users WHERE name = 'Sandhya Konduru'), 500000.00, 0.00, 2.00, 'monthly', NULL, 'INR', 'cleared', 'Cleared with interest');

-- Lokesh Friend lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Lokesh Friend'), (SELECT user_id FROM users WHERE name = 'Shiva'), 650000.00, 0.00, 1.50, 'half_yearly', '2024-03-21', 'INR', 'cleared', 'Cleared with interest');

-- Aravindha lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Aravindha'), (SELECT user_id FROM users WHERE name = 'Shiva'), 1000000.00, 0.00, 1.25, 'quarterly', '2023-02-11', 'INR', 'cleared', NULL);

-- Ravi Raju lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Ravi Raju'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 1000000.00, 0.00, 2.00, 'monthly', NULL, 'INR', 'cleared', 'Paid with interest 50,000 INR');

-- Naveen lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Naveen'), (SELECT user_id FROM users WHERE name = 'Shiva'), 4000000.00, 0.00, 1.50, 'unknown', NULL, 'INR', 'cleared', 'Paid off 40L in April 1st week. Interest amount pending');

-- ============================================================================
-- ACTIVE DEBTS
-- ============================================================================

-- Kuber Karur lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Kuber Karur'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 200000.00, 200000.00, 2.00, 'monthly', NULL, 'INR', 'active', NULL);

-- Siddi Raju lent to Shiva (1st entry)
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Siddi Raju'), (SELECT user_id FROM users WHERE name = 'Shiva'), 500000.00, 500000.00, 2.00, 'yearly', '2023-02-10', 'INR', 'active', 'Interest Paid. Can wait until next year');

-- Thatha lent to Jayalakshmi (Amma)
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Thatha'), (SELECT user_id FROM users WHERE name = 'Jayalakshmi'), 500000.00, 200000.00, 2.00, 'half_yearly', NULL, 'INR', 'active', 'Mom is taking care of this');

-- Barathi Atha lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Barathi Atha'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 500000.00, 500000.00, 2.00, 'yearly', NULL, 'INR', 'active', '2L interest outstanding. Haven''t paid interest since 2 years');

-- Sankarraju lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Sankarraju'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 500000.00, 500000.00, 2.00, 'yearly', NULL, 'INR', 'active', NULL);

-- Sankar Naidu lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Sankar Naidu'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 500000.00, 500000.00, 2.00, 'unknown', NULL, 'INR', 'active', NULL);

-- Deepa lent to Sandhya
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Deepa'), (SELECT user_id FROM users WHERE name = 'Sandhya Konduru'), 500000.00, 100000.00, 2.00, 'monthly', NULL, 'INR', 'active', 'Interest 10k paid along with 50k principal amount. 3.5L paid on May 19th, 2026.');

-- OSivagiri lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'OSivagiri'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 550000.00, 100000.00, 2.00, 'unknown', NULL, 'INR', 'active', NULL);

-- OBR CM lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'OBR CM'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 600000.00, 600000.00, 2.00, 'unknown', NULL, 'INR', 'active', NULL);

-- ABP Bedu lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'ABP Bedu'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 950000.00, 950000.00, 2.00, 'unknown', NULL, 'INR', 'active', NULL);

-- Naveen Friend lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Naveen Friend'), (SELECT user_id FROM users WHERE name = 'Shiva'), 1500000.00, 1280000.00, 2.00, 'half_yearly', '2024-11-15', 'INR', 'active', 'Paid interest on May31, 2026. 1.8L (paid through shiva)');

-- PB Raju lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'PB Raju'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 1500000.00, 1500000.00, 2.00, 'quarterly', NULL, 'INR', 'active', NULL);

-- Uthukota lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Uthukota'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 2000000.00, 1600000.00, 2.00, 'unknown', NULL, 'INR', 'active', 'Dad sent 2L. But interest outstanding since 1 year. I sent 2L on July 1st week.');

-- Jyotheeswar lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar'), (SELECT user_id FROM users WHERE name = 'Shiva'), 1000000.00, 1000000.00, 1.50, 'quarterly', '2023-09-25', 'INR', 'active', '90k interest paid on june 1st for last 6 months.');

-- Siddi Raju lent to Shiva (2nd entry)
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Siddi Raju'), (SELECT user_id FROM users WHERE name = 'Shiva'), 1000000.00, 1000000.00, 1.50, 'yearly', '2024-09-15', 'INR', 'active', NULL);

-- Ramesh lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Ramesh'), (SELECT user_id FROM users WHERE name = 'Shiva'), 1000000.00, 1000000.00, 1.50, 'half_yearly', '2024-11-15', 'INR', 'active', 'Interest 90k paid on June 1st, 2026.');

-- Ramapuram lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Ramapuram'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 1500000.00, 700000.00, 1.50, 'unknown', NULL, 'INR', 'active', 'Interest paid in Jan. 10L paid off in April 1st week. 5L remaining. Interest is yet to be calculated.');

-- TPT Atha lent to Venkata (1st entry)
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'TPT Atha'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 5200000.00, 5200000.00, 1.50, 'adhoc', NULL, 'INR', 'active', NULL);

-- TPT Atha lent to Venkata (2nd entry)
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'TPT Atha'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 794500.00, 494500.00, 1.50, 'adhoc', NULL, 'INR', 'active', '3L principal paid');

-- Bangarraju lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Bangarraju'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 13500000.00, 13500000.00, 1.50, 'adhoc', NULL, 'INR', 'active', NULL);

-- Avva lent to Jayalakshmi
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Avva'), (SELECT user_id FROM users WHERE name = 'Jayalakshmi'), 1200000.00, 500000.00, NULL, 'unknown', NULL, 'INR', 'active', 'Mom will take care of this');

-- Lokesh lent to Shiva
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Lokesh'), (SELECT user_id FROM users WHERE name = 'Shiva'), 1550000.00, 1550000.00, 1.25, 'half_yearly', '2024-05-10', 'INR', 'active', 'Paid 285000 interest on march 17th');

-- Bujji Uncle lent to Venkata
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Bujji Uncle'), (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'), 2500000.00, 2500000.00, NULL, 'unknown', NULL, 'INR', 'active', NULL);

-- Kantha lent to Swathi Konduru
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Kantha'), (SELECT user_id FROM users WHERE name = 'Swathi Konduru'), 5000000.00, 5000000.00, 1.00, 'yearly', '2026-04-01', 'INR', 'active', NULL);

-- Rupa gold lent to Sandhya
INSERT INTO debts (lender_id, borrower_id, principal_amount, principal_remaining, interest_rate, interest_frequency, date_of_debt, currency, status, notes)
VALUES ((SELECT lender_id FROM lenders WHERE name = 'Rupa gold'), (SELECT user_id FROM users WHERE name = 'Sandhya Konduru'), 200000.00, 200000.00, NULL, 'unknown', NULL, 'INR', 'active', NULL);
