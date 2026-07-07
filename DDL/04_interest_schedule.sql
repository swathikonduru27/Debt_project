-- ============================================================================
-- INTEREST_SCHEDULE TABLE
-- ============================================================================
-- Description: Time-based interest periods for each debt
-- Breaks down when interest is due (monthly, quarterly, etc.)
-- ============================================================================

CREATE TABLE interest_schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    debt_id INT NOT NULL,
    period_number INT NOT NULL COMMENT 'Sequential number (1, 2, 3, ...)',
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    due_date DATE NOT NULL,
    amount_due DECIMAL(12, 2) NOT NULL COMMENT 'Interest amount due for this period',
    status VARCHAR(20) DEFAULT 'pending' COMMENT 'pending, paid, partial, overdue',
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (debt_id) REFERENCES debts(debt_id),

    INDEX idx_debt (debt_id),
    INDEX idx_status (status),
    INDEX idx_due_date (due_date),
    UNIQUE KEY unique_debt_period (debt_id, period_number)
);
