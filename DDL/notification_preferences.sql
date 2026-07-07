-- ============================================================================
-- NOTIFICATION_PREFERENCES TABLE
-- ============================================================================
-- Description: User's communication settings
-- Controls what alerts they receive, when, and how (email/SMS/phone)
-- ============================================================================

CREATE TABLE notification_preferences (
    preference_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    alert_type VARCHAR(50) NOT NULL COMMENT 'due_soon, overdue, milestone, etc.',
    enabled BOOLEAN DEFAULT TRUE COMMENT 'User wants this type of alert',
    preferred_contact VARCHAR(20) NOT NULL COMMENT 'email, sms, phone',
    days_before_due INT DEFAULT 7 COMMENT 'How many days before due date to send alert',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id),

    INDEX idx_user (user_id),
    INDEX idx_alert_type (alert_type),
    UNIQUE KEY unique_user_alert (user_id, alert_type, preferred_contact)
);
