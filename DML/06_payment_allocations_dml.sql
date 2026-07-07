-- ============================================================================
-- PAYMENT_ALLOCATIONS DML - Insert Payment Allocations
-- ============================================================================
-- Maps payments to interest schedule periods and principal/interest split
-- ============================================================================

-- Jyotheeswar payment (90k) - All to interest
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 90000.00 AND payment_date = '2026-06-01' LIMIT 1),
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = (SELECT debt_id FROM debts WHERE principal_amount = 1000000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar') LIMIT 1) AND period_number = 4 LIMIT 1),
  0.00,
  90000.00;

-- Ramesh payment (90k) - All to interest
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 90000.00 AND payment_date = '2026-06-01' AND debt_id = (SELECT debt_id FROM debts WHERE lender_id = (SELECT lender_id FROM lenders WHERE name = 'Ramesh') LIMIT 1) LIMIT 1),
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = (SELECT debt_id FROM debts WHERE principal_amount = 1000000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Ramesh') LIMIT 1) AND period_number = 2 LIMIT 1),
  0.00,
  90000.00;

-- Lokesh payment (285k) - All to interest
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 285000.00 AND payment_date = '2026-03-17' LIMIT 1),
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = (SELECT debt_id FROM debts WHERE principal_amount = 1550000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh') LIMIT 1) AND period_number = 1 LIMIT 1),
  0.00,
  285000.00;

-- Naveen Friend payment (180k) - All to interest
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 180000.00 AND payment_date = '2026-05-31' LIMIT 1),
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = (SELECT debt_id FROM debts WHERE principal_amount = 1500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Naveen Friend') LIMIT 1) AND period_number = 1 LIMIT 1),
  0.00,
  180000.00;

-- Deepa payment (360k) - 350k principal + 10k interest
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 360000.00 AND payment_date = '2026-05-19' LIMIT 1),
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = (SELECT debt_id FROM debts WHERE principal_amount = 500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa') LIMIT 1) AND period_number = 5 LIMIT 1),
  350000.00,
  10000.00;

-- Ramapuram payment (1000k) - All principal
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 1000000.00 AND payment_date = '2026-04-05' AND debt_id = (SELECT debt_id FROM debts WHERE principal_amount = 1500000 AND lender_id = (SELECT lender_id FROM lenders WHERE name = 'Ramapuram') LIMIT 1) LIMIT 1),
  NULL,
  1000000.00,
  0.00;

-- Uthukota payment (200k) - All principal
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 200000.00 AND payment_date = '2026-07-05' LIMIT 1),
  NULL,
  200000.00,
  0.00;

-- Naveen payment (3640k) - All principal (debt was cleared)
INSERT INTO payment_allocations (payment_id, schedule_id, principal_amount, interest_amount)
SELECT
  (SELECT payment_id FROM payments WHERE amount_paid = 3640000.00 AND payment_date = '2026-04-05' LIMIT 1),
  NULL,
  3640000.00,
  0.00;
