INSERT INTO payments(
	payment_id, interest_id, debt_id, payment_frequency, amount_paid, payment_date, interest, principal, paid_by, last_updated)
	VALUES 
    (1, 1, 1, 'Yearly', 120000, '2025-02-10', '2025-02-10', true, false, "Swathi Konduru",current_timestamp),
	(2, 1, 1, 'Yearly', 120000, '2025-02-10', '2024-02-10', true, false, "Swathi Konduru",current_timestamp);