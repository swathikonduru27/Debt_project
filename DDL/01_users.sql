-- ============================================================================
-- USERS TABLE
-- ============================================================================
-- Description: Family members who can borrow money and make payments
-- ============================================================================

CREATE TABLE finances.users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_email ON finances.users(email);
CREATE INDEX idx_name ON finances.users(name);
