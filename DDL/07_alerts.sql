-- ============================================================================
-- ALERTS TABLE
-- ============================================================================
-- Description: Notifications about upcoming or overdue payments
-- Reminders sent to users based on their preferences
-- ============================================================================

CREATE TABLE finances.alerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    debt_id INT NOT NULL,
    schedule_id INT,
    recipient_id INT NOT NULL,
    alert_type VARCHAR(50) NOT NULL COMMENT 'due_soon, overdue, milestone, etc.',
    due_date DATE NOT NULL,
    contact_method VARCHAR(20) COMMENT 'email, sms, phone',
    delivery_status VARCHAR(20) DEFAULT 'pending' COMMENT 'pending, sent, failed, delivered',
    message TEXT,
    sent_at TIMESTAMP NULL,
    retry_count INT DEFAULT 0,
    error_message TEXT,
    last_retry_at TIMESTAMP NULL,
    status VARCHAR(20) DEFAULT 'pending' COMMENT 'pending, acknowledged, resolved',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (debt_id) REFERENCES finances.debts(debt_id),
    FOREIGN KEY (schedule_id) REFERENCES finances.interest_schedule(schedule_id),
    FOREIGN KEY (recipient_id) REFERENCES finances.users(user_id),

    INDEX idx_debt (debt_id),
    INDEX idx_recipient (recipient_id),
    INDEX idx_alert_type (alert_type),
    INDEX idx_delivery_status (delivery_status),
    INDEX idx_due_date (due_date),
    INDEX idx_created_at (created_at)
);
