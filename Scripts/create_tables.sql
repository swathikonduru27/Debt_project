-- ============================================================================
-- Master DDL Setup - Creates all tables in correct order
-- Schema: finances
-- ============================================================================
-- Execute this script to create all tables at once
-- Individual DDL files are located in ../DDL/ folder
-- ============================================================================

\i ../DDL/01_users.sql
\i ../DDL/02_lenders.sql
\i ../DDL/03_debts.sql
\i ../DDL/04_interest_schedule.sql
\i ../DDL/05_payments.sql
\i ../DDL/06_payment_allocations.sql
\i ../DDL/07_alerts.sql
\i ../DDL/08_notification_preferences.sql
