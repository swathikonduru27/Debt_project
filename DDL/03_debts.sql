-- ============================================================================
-- DEBTS TABLE
-- ============================================================================
-- Description: Individual loan agreements between a user and lender
-- Core business entity - tracks principal, interest, and repayment status
-- ============================================================================

DROP TABLE IF EXISTS finances.debts CASCADE;

CREATE TABLE finances.debts (
    debt_id SERIAL PRIMARY KEY,
    lender_id INT NOT NULL,
    borrower_id INT NOT NULL,
    principal_amount DECIMAL(12, 2) NOT NULL,
    principal_remaining DECIMAL(12, 2) NOT NULL,
    interest_rate DECIMAL(5, 2),
    interest_frequency VARCHAR(20) NOT NULL DEFAULT 'monthly',
    date_of_debt DATE,
    currency VARCHAR(3) DEFAULT 'USD',
    status VARCHAR(20) DEFAULT 'active',
    notes TEXT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lender_id) REFERENCES finances.lenders(lender_id),
    FOREIGN KEY (borrower_id) REFERENCES finances.users(user_id)
);

CREATE INDEX idx_lender ON finances.debts(lender_id);
CREATE INDEX idx_borrower ON finances.debts(borrower_id);
CREATE INDEX idx_status ON finances.debts(status);
CREATE INDEX idx_date ON finances.debts(date_of_debt);
