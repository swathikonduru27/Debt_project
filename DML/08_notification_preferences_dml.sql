-- ============================================================================
-- NOTIFICATION_PREFERENCES DML - Insert User Notification Settings
-- ============================================================================
-- Configure how and when each borrower wants to be notified about alerts
-- ============================================================================

-- Sandhya Konduru preferences
INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Sandhya Konduru'), 'due_soon', TRUE, 'email', 7);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Sandhya Konduru'), 'overdue', TRUE, 'email', 0);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Sandhya Konduru'), 'milestone', TRUE, 'email', 0);

-- Swathi Konduru preferences
INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Swathi Konduru'), 'due_soon', TRUE, 'email', 7);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Swathi Konduru'), 'overdue', TRUE, 'email', 0);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Swathi Konduru'), 'milestone', FALSE, 'email', 0);

-- Jayalakshmi (Amma) preferences
INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Jayalakshmi'), 'due_soon', TRUE, 'email', 14);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Jayalakshmi'), 'overdue', TRUE, 'email', 0);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Jayalakshmi'), 'milestone', FALSE, 'email', 0);

-- Konduru Venkata Chalapathi Raju preferences
INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Konduru Venkata Chalapathi Raju'), 'due_soon', TRUE, 'email', 7);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Konduru Venkata Chalapathi Raju'), 'overdue', TRUE, 'email', 0);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Konduru Venkata Chalapathi Raju'), 'milestone', TRUE, 'email', 0);

-- Shiva preferences
INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Shiva'), 'due_soon', TRUE, 'email', 7);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Shiva'), 'overdue', TRUE, 'email', 0);

INSERT INTO finances.notification_preferences (user_id, alert_type, enabled, preferred_contact, days_before_due)
VALUES ((SELECT user_id FROM finances.users WHERE name = 'Shiva'), 'milestone', FALSE, 'email', 0);
