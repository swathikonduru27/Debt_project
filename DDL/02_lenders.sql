-- ============================================================================
-- LENDERS TABLE
-- ============================================================================
-- Description: People/entities who lend money to the family
-- ============================================================================

CREATE TABLE finances.lenders (
    lender_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    relationship_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_email ON finances.lenders(email);
CREATE INDEX idx_name ON finances.lenders(name);
