-- ============================================================================
-- LENDERS TABLE
-- ============================================================================
-- Description: People/entities who lend money to the family
-- ============================================================================

CREATE TABLE lenders (
    lender_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    relationship_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_email (email),
    INDEX idx_name (name)
);
