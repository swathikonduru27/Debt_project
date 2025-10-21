create table payments(
payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
interest_id int,
debt_id int,
payment_frequency varchar,
Amount_paid float,
Payment_date date,
Interest boolean,
Principal boolean,
Paid_by varchar,
last_updated timestamp
);