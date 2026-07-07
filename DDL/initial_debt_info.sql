CREATE TABLE finances.initial_debt_info (
    debt_id INT PRIMARY KEY,
    name VARCHAR(100),
    amount DECIMAL(12, 2),
    interest_rate DECIMAL(5, 2),
    date_of_debt DATE,
    interest_frequency VARCHAR(20),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);