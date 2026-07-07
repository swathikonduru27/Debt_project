-- ============================================================================
-- DEBTS TABLE
-- ============================================================================
-- Description: Individual loan agreements between a user and lender
-- Core business entity - tracks principal, interest, and repayment status
-- ============================================================================

CREATE TABLE finances.debts (
    debt_id INT PRIMARY KEY AUTO_INCREMENT,
    lender_id INT NOT NULL,
    borrower_id INT NOT NULL,
    principal_amount DECIMAL(12, 2) NOT NULL,
    principal_remaining DECIMAL(12, 2) NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL COMMENT 'Annual interest rate as percentage',
    interest_frequency VARCHAR(20) NOT NULL DEFAULT 'monthly' COMMENT 'monthly, quarterly, annually, etc.',
    date_of_debt DATE NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD',
    status VARCHAR(20) DEFAULT 'active' COMMENT 'active, settled, defaulted, etc.',
    notes TEXT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (lender_id) REFERENCES finances.lenders(lender_id),
    FOREIGN KEY (borrower_id) REFERENCES finances.users(user_id),

    INDEX idx_lender (lender_id),
    INDEX idx_borrower (borrower_id),
    INDEX idx_status (status),
    INDEX idx_date (date_of_debt)
);
