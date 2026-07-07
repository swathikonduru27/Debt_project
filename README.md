# Debt Tracker Database

## DDL Files

All table definitions are in `DDL/` folder. Create tables in this order:

1. **users.sql** - User/borrower information
2. **lenders.sql** - Lender information
3. **debts.sql** - Loan agreements (core entity)
4. **interest_schedule.sql** - Interest accrual periods
5. **payments.sql** - Payment transactions
6. **payment_allocations.sql** - Split payments (principal/interest)
7. **alerts.sql** - Alert notifications with delivery tracking
8. **notification_preferences.sql** - User notification settings

---

## Table Structures

### users
```sql
user_id (PK), name, email (UNIQUE), phone, created_at
```

### lenders
```sql
lender_id (PK), name, email (UNIQUE), phone, relationship_type, created_at
```

### debts
```sql
debt_id (PK), lender_id (FK), borrower_id (FK), principal_amount, principal_remaining,
interest_rate, interest_frequency, date_of_debt, currency, status, notes, last_updated
```

### interest_schedule
```sql
schedule_id (PK), debt_id (FK), period_number, period_start, period_end,
due_date, amount_due, status, last_updated
Unique: (debt_id, period_number)
```

### payments
```sql
payment_id (PK), debt_id (FK), paid_by (FK), amount_paid, payment_date, notes, created_at
```

### payment_allocations
```sql
allocation_id (PK), payment_id (FK), schedule_id (FK), principal_amount, interest_amount, created_at
```

### alerts
```sql
alert_id (PK), debt_id (FK), schedule_id (FK), recipient_id (FK), alert_type, due_date,
contact_method, delivery_status, message, sent_at, retry_count, error_message, last_retry_at,
status, created_at
```

### notification_preferences
```sql
preference_id (PK), user_id (FK), alert_type, enabled, preferred_contact, days_before_due,
created_at, updated_at
Unique: (user_id, alert_type, preferred_contact)
```

---

## Indexing Strategy

### Foreign Key Indexes
Speed up joins and constraint checks:
- `users`: idx_email, idx_name
- `lenders`: idx_email, idx_name
- `debts`: idx_lender, idx_borrower, idx_status, idx_date
- `interest_schedule`: idx_debt, idx_status, idx_due_date
- `payments`: idx_debt, idx_paid_by, idx_payment_date
- `payment_allocations`: idx_payment, idx_schedule
- `alerts`: idx_debt, idx_recipient, idx_alert_type, idx_delivery_status, idx_due_date, idx_created_at
- `notification_preferences`: idx_user, idx_alert_type

### Index Purpose by Type

| Index Type | Purpose | Examples |
|---|---|---|
| **Search** | Fast lookups by unique ID | email, name |
| **Filter** | Speed up WHERE clauses | status, alert_type, delivery_status |
| **Join** | Optimize relationships | Foreign key columns |
| **Date** | Range queries & sorting | due_date, payment_date, created_at |
| **Unique** | Data integrity + index | (debt_id, period_number), (user_id, alert_type, preferred_contact) |

### Query Patterns Optimized
- Find all debts for a user → `idx_borrower`
- Find all payments for a debt → `idx_debt`
- Find pending/failed alerts → `idx_delivery_status`
- Find upcoming/overdue interest → `idx_due_date`
- Find user preferences → `idx_user`
- Find recent activity → `idx_created_at`

**Note**: Indexes are based on common query patterns. Customize based on your actual workload.
