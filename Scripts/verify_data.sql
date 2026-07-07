-- ============================================================================
-- Verification Queries - Run after all DML scripts
-- Schema: finances
-- ============================================================================

SELECT COUNT(*) as total_users FROM finances.users;
SELECT COUNT(*) as total_lenders FROM finances.lenders;
SELECT COUNT(*) as total_debts FROM finances.debts;
SELECT COUNT(*) as active_debts FROM finances.debts WHERE status = 'active';
SELECT COUNT(*) as cleared_debts FROM finances.debts WHERE status = 'cleared';
SELECT COUNT(*) as total_notification_prefs FROM finances.notification_preferences;
