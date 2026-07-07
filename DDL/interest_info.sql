CREATE TABLE finances.interest_info (
    interest_id SERIAL PRIMARY KEY,
    debt_id INT NOT NULL,
    interest_rate DECIMAL(5, 2),
    interest_amount DECIMAL(12, 2),
    payment_id INT,
    currency VARCHAR(3),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);