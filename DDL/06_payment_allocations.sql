-- ============================================================================
-- PAYMENT_ALLOCATIONS TABLE
-- ============================================================================
-- Description: How a single payment covers multiple interest periods and principal
-- Tracks which part of a payment goes to interest vs principal
-- ============================================================================

CREATE TABLE finances.payment_allocations (
    allocation_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_id INT NOT NULL,
    schedule_id INT,
    principal_amount DECIMAL(12, 2) NOT NULL DEFAULT 0,
    interest_amount DECIMAL(12, 2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (payment_id) REFERENCES finances.payments(payment_id),
    FOREIGN KEY (schedule_id) REFERENCES finances.interest_schedule(schedule_id),

    INDEX idx_payment (payment_id),
    INDEX idx_schedule (schedule_id),
    CHECK (principal_amount >= 0),
    CHECK (interest_amount >= 0)
);
