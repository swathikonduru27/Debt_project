-- ============================================================================
-- Master DML Setup - Loads all data in correct order
-- Schema: finances
-- ============================================================================
-- Execute this script to load all data at once
-- Individual DML files are located in ../DML/ folder
-- ============================================================================

\i ../DML/01_users_dml.sql
\i ../DML/02_lenders_dml.sql
\i ../DML/03_debts_dml.sql
\i ../DML/08_notification_preferences_dml.sql
