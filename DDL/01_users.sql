-- ============================================================================
-- USERS TABLE
-- ============================================================================
-- Description: Family members who can borrow money and make payments
-- ============================================================================

CREATE TABLE finances.users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_email (email),
    INDEX idx_name (name)
);
