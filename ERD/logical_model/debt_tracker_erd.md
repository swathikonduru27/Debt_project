# Debt Tracker — Entity Relationship Diagram

```mermaid
erDiagram
    users {
        int user_id PK
        varchar name
        varchar email
        varchar phone
        timestamp created_at
    }

    lenders {
        int lender_id PK
        varchar name
        varchar phone
        varchar email
        varchar relationship_type
        timestamp created_at
    }

    debts {
        int debt_id PK
        int lender_id FK
        int borrower_id FK
        float principal_amount
        float principal_remaining
        float interest_rate
        varchar interest_frequency
        date date_of_debt
        varchar currency
        varchar status
        text notes
        timestamp last_updated
    }

    interest_schedule {
        int schedule_id PK
        int debt_id FK
        int period_number
        date period_start
        date period_end
        date due_date
        float amount_due
        varchar status
        timestamp last_updated
    }

    payments {
        int payment_id PK
        int debt_id FK
        int paid_by FK
        float amount_paid
        date payment_date
        text notes
        timestamp created_at
    }

    payment_allocations {
        int allocation_id PK
        int payment_id FK
        int schedule_id FK
        float principal_amount
        float interest_amount
        timestamp created_at
    }

    alerts {
        int alert_id PK
        int debt_id FK
        int schedule_id FK
        int recipient_id FK
        varchar alert_type
        date due_date
        varchar contact_method
        varchar delivery_status
        text message
        timestamp sent_at
        int retry_count
        text error_message
        timestamp last_retry_at
        varchar status
        timestamp created_at
    }

    notification_preferences {
        int preference_id PK
        int user_id FK
        varchar alert_type
        boolean enabled
        varchar preferred_contact
        int days_before_due
        timestamp created_at
        timestamp updated_at
    }

    lenders       ||--o{ debts                : "lends to"
    users         ||--o{ debts                : "borrowed by"
    users         ||--o{ payments             : "paid by"
    debts         ||--o{ interest_schedule    : "generates"
    debts         ||--o{ payments             : "paid via"
    debts         ||--o{ alerts               : "triggers"
    payments      ||--o{ payment_allocations  : "split into"
    interest_schedule ||--o{ payment_allocations : "settled by"
    interest_schedule ||--o{ alerts           : "alerts for"
users         ||--o{ notification_preferences : "has"
    alerts        ||--o{ notification_preferences : "uses"
```

## Relationship Notes

| Relationship | Cardinality | Why |
|---|---|---|
| lenders → debts | one-to-many | Same person can lend multiple times (e.g., Lokesh has 3 debts) |
| users → debts | one-to-many | One family member can be borrower on multiple debts |
| users → payments | one-to-many | Any family member can make a payment |
| debts → interest_schedule | one-to-many | Each debt generates one row per interest period |
| debts → payments | one-to-many | A debt can receive many payments over time |
| payments → payment_allocations | one-to-many | A single payment can partly cover interest + partly cover principal |
| interest_schedule → payment_allocations | one-to-many | A schedule period can be partially paid across multiple payments |
| debts → alerts | one-to-many | Multiple alert types per debt (due soon, overdue, milestone) |
| interest_schedule → alerts | one-to-many | Alerts tied to specific interest due dates |
| alerts → notification_preferences | one-to-many | Alerts configured based on user notification preferences |
| notification_preferences → users | many-to-one | Each preference belongs to one user |
