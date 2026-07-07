-- ============================================================================
-- PAYMENTS TABLE
-- ============================================================================
-- Description: Actual payments made to settle debts
-- Records of money transferred by users
-- ============================================================================

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    debt_id INT NOT NULL,
    paid_by INT NOT NULL,
    amount_paid DECIMAL(12, 2) NOT NULL,
    payment_date DATE NOT NULL,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (debt_id) REFERENCES debts(debt_id),
    FOREIGN KEY (paid_by) REFERENCES users(user_id),

    INDEX idx_debt (debt_id),
    INDEX idx_paid_by (paid_by),
    INDEX idx_payment_date (payment_date)
);
