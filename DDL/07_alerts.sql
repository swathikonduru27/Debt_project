-- ============================================================================
-- ALERTS TABLE
-- ============================================================================
-- Description: Notifications about upcoming or overdue payments
-- Reminders sent to users based on their preferences
-- ============================================================================

CREATE TABLE finances.alerts (
    alert_id SERIAL PRIMARY KEY,
    debt_id INT NOT NULL,
    schedule_id INT,
    recipient_id INT NOT NULL,
    alert_type VARCHAR(50) NOT NULL,
    due_date DATE NOT NULL,
    contact_method VARCHAR(20),
    delivery_status VARCHAR(20) DEFAULT 'pending',
    message TEXT,
    sent_at TIMESTAMP,
    retry_count INT DEFAULT 0,
    error_message TEXT,
    last_retry_at TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (debt_id) REFERENCES finances.debts(debt_id),
    FOREIGN KEY (schedule_id) REFERENCES finances.interest_schedule(schedule_id),
    FOREIGN KEY (recipient_id) REFERENCES finances.users(user_id)
);

CREATE INDEX idx_debt ON finances.alerts(debt_id);
CREATE INDEX idx_recipient ON finances.alerts(recipient_id);
CREATE INDEX idx_alert_type ON finances.alerts(alert_type);
CREATE INDEX idx_delivery_status ON finances.alerts(delivery_status);
CREATE INDEX idx_due_date ON finances.alerts(due_date);
CREATE INDEX idx_created_at ON finances.alerts(created_at);
