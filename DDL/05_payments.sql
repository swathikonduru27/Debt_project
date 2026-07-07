-- ============================================================================
-- PAYMENTS TABLE
-- ============================================================================
-- Description: Actual payments made to settle debts
-- Records of money transferred by users
-- ============================================================================

CREATE TABLE finances.payments (
    payment_id SERIAL PRIMARY KEY,
    debt_id INT NOT NULL,
    paid_by INT NOT NULL,
    amount_paid DECIMAL(12, 2) NOT NULL,
    payment_date DATE NOT NULL,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (debt_id) REFERENCES finances.debts(debt_id),
    FOREIGN KEY (paid_by) REFERENCES finances.users(user_id)
);

CREATE INDEX idx_debt ON finances.payments(debt_id);
CREATE INDEX idx_paid_by ON finances.payments(paid_by);
CREATE INDEX idx_payment_date ON finances.payments(payment_date);
