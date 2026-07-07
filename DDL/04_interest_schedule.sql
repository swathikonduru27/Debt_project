-- ============================================================================
-- INTEREST_SCHEDULE TABLE
-- ============================================================================
-- Description: Time-based interest periods for each debt
-- Breaks down when interest is due (monthly, quarterly, etc.)
-- ============================================================================

CREATE TABLE finances.interest_schedule (
    schedule_id SERIAL PRIMARY KEY,
    debt_id INT NOT NULL,
    period_number INT NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    due_date DATE NOT NULL,
    amount_due DECIMAL(12, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (debt_id) REFERENCES finances.debts(debt_id),
    UNIQUE (debt_id, period_number)
);

CREATE INDEX idx_debt ON finances.interest_schedule(debt_id);
CREATE INDEX idx_status ON finances.interest_schedule(status);
CREATE INDEX idx_due_date ON finances.interest_schedule(due_date);
