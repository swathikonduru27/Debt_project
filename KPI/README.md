# KPI Suite

5 SQL files with queries for debt tracking analytics.

## Files

**01_portfolio_overview.sql** - Portfolio health snapshot
- Total active debts, principal outstanding, average interest rate
- Debt status breakdown, size distribution, interest accrual status

**02_payment_health.sql** - Payment performance
- Monthly payment trends, payment counts and amounts
- Debts with late/missing payments, payment consistency by borrower

**03_person_level_analysis.sql** - Borrower & lender view
- Debt summary per borrower and lender
- Payment contribution, collections received, exposure analysis

**04_payoff_projections.sql** - Timelines & risk
- Estimated payoff dates based on payment velocity
- At-risk debts, completion stage breakdown

**05_interest_analysis.sql** - Interest tracking by month
- Interest accrued, paid, pending by month (historical & projected)
- Interest by borrower, lender, debt
- Overdue interest, monthly projections

## Quick Start

Run any query in your DB client or build stored procedures around them.
All queries are self-contained and can be parameterized for specific borrowers, lenders, or date ranges.
