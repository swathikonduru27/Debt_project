-- ============================================================================
-- ALERTS DML - Insert Alert Notifications
-- ============================================================================
-- Create alerts for upcoming and overdue interest payments
-- ============================================================================

-- Jyotheeswar → Shiva: Alert for overdue interest (Period 5, due Dec 23, 2024 - now overdue)
INSERT INTO alerts (debt_id, schedule_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = d.debt_id AND period_number = 5 LIMIT 1),
  (SELECT user_id FROM users WHERE name = 'Shiva'),
  'overdue',
  '2024-12-23',
  'email',
  'pending',
  'Interest payment of 3750 INR is overdue since Dec 23, 2024',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 1000000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Jyotheeswar')
LIMIT 1;

-- Ramesh → Shiva: Alert for upcoming interest (Period 2, due May 9, 2025)
INSERT INTO alerts (debt_id, schedule_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = d.debt_id AND period_number = 2 LIMIT 1),
  (SELECT user_id FROM users WHERE name = 'Shiva'),
  'due_soon',
  '2025-05-09',
  'email',
  'pending',
  'Interest payment of 3750 INR due on May 9, 2025',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 1000000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Ramesh')
LIMIT 1;

-- Lokesh → Shiva: Alert for upcoming interest (Period 2, due Nov 9, 2024)
INSERT INTO alerts (debt_id, schedule_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = d.debt_id AND period_number = 2 LIMIT 1),
  (SELECT user_id FROM users WHERE name = 'Shiva'),
  'due_soon',
  '2025-05-09',
  'email',
  'pending',
  'Interest payment of 9687.50 INR due on May 9, 2025',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 1550000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Lokesh')
LIMIT 1;

-- Naveen Friend → Shiva: Alert for upcoming interest (Period 2, due Nov 14, 2025)
INSERT INTO alerts (debt_id, schedule_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = d.debt_id AND period_number = 2 LIMIT 1),
  (SELECT user_id FROM users WHERE name = 'Shiva'),
  'due_soon',
  '2025-11-14',
  'email',
  'pending',
  'Interest payment of 15000 INR due on Nov 14, 2025',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 1500000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Naveen Friend')
LIMIT 1;

-- Deepa → Sandhya: Alert for upcoming interest (Period 6, due Jun 30, 2026)
INSERT INTO alerts (debt_id, schedule_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT schedule_id FROM interest_schedule WHERE debt_id = d.debt_id AND period_number = 6 LIMIT 1),
  (SELECT user_id FROM users WHERE name = 'Sandhya Konduru'),
  'due_soon',
  '2026-06-30',
  'email',
  'pending',
  'Interest payment of 1046.67 INR due on Jun 30, 2026',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 500000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Deepa')
LIMIT 1;

-- Kuber Karur → Venkata: Alert for overdue interest (Active debt - monthly)
INSERT INTO alerts (debt_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'),
  'overdue',
  CURDATE() - INTERVAL 30 DAY,
  'email',
  'pending',
  'Monthly interest payment is overdue',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 200000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Kuber Karur')
LIMIT 1;

-- Barathi Atha → Venkata: Alert for significantly overdue interest (2 years outstanding)
INSERT INTO alerts (debt_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'),
  'overdue',
  '2024-01-01',
  'email',
  'pending',
  'Interest payment significantly overdue - 2L interest outstanding. Haven''t paid interest since 2 years',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 500000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Barathi Atha')
LIMIT 1;

-- PB Raju → Venkata: Alert for upcoming quarterly interest
INSERT INTO alerts (debt_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'),
  'due_soon',
  CURDATE() + INTERVAL 7 DAY,
  'email',
  'pending',
  'Quarterly interest payment due in 7 days',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 1500000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'PB Raju')
LIMIT 1;

-- Bangarraju → Venkata: Alert for large outstanding debt
INSERT INTO alerts (debt_id, recipient_id, alert_type, due_date, contact_method, delivery_status, message, status, created_at)
SELECT
  d.debt_id,
  (SELECT user_id FROM users WHERE name = 'Konduru Venkata Chalapathi Raju'),
  'milestone',
  CURDATE(),
  'email',
  'pending',
  'Large outstanding debt of 13.5 Crores',
  'pending',
  NOW()
FROM debts d
WHERE d.principal_amount = 13500000
AND d.lender_id = (SELECT lender_id FROM lenders WHERE name = 'Bangarraju')
LIMIT 1;
