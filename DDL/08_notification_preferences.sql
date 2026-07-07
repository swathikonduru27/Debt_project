-- ============================================================================
-- NOTIFICATION_PREFERENCES TABLE
-- ============================================================================
-- Description: User's communication settings
-- Controls what alerts they receive, when, and how (email/SMS/phone)
-- ============================================================================

CREATE TABLE finances.notification_preferences (
    preference_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    alert_type VARCHAR(50) NOT NULL,
    enabled BOOLEAN DEFAULT TRUE,
    preferred_contact VARCHAR(20) NOT NULL,
    days_before_due INT DEFAULT 7,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES finances.users(user_id),
    UNIQUE (user_id, alert_type, preferred_contact)
);

CREATE INDEX idx_user ON finances.notification_preferences(user_id);
CREATE INDEX idx_alert_type ON finances.notification_preferences(alert_type);
