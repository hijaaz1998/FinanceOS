# 02_CUSTOMER_MANAGEMENT.md

## FinanceOS — Customer Management System Specification

**Document ID:** WEB-ADMIN-02

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Customer Management System)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `01_ADMIN_LAYOUT_AND_NAVIGATION.md`
- `docs/web/user/08_AUTH_AND_USER_ACCOUNTS.md`
- `docs/web/user/09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `docs/web/user/10_CUSTOMER_DASHBOARD.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`

---

# Purpose

This document defines the complete **Customer Management module** inside the FinanceOS Admin Portal.

The module allows administrators to:

- View all registered customers.
- Search and filter customers.
- View complete customer profiles.
- View purchases and licenses.
- View download history.
- View invoices.
- View customer activity timeline.
- Manage account status.

This is the **single source of truth** for Cursor when implementing customer management.

---

# Customer Management Philosophy

Every FinanceOS customer should have **one unified customer profile** that contains everything related to their account.

The Admin Portal should answer these questions immediately:

- Who is this customer?
- What did they purchase?
- Which version do they own?
- How many times have they downloaded?
- Have they requested refunds?
- Have they verified their email?

No customer information should be spread across multiple pages.

---

# Customer Module Overview

The Customer Management module contains **8 major sections**.

| Section | Purpose |
|--------|---------|
| Customer List | Master customer database. |
| Customer Profile | Complete customer details. |
| Purchase History | Orders and invoices. |
| License Center | Active product licenses. |
| Download History | Workbook download records. |
| Activity Timeline | Customer account events. |
| Account Status | Verification and account state. |
| Admin Actions | Manual administrative actions. |

---

# Customer Navigation Structure

```text id="wgcjlwm"
Customers
│
├── Customer List
├── Customer Profile
│     ├── Overview
│     ├── Purchases
│     ├── Downloads
│     ├── Invoices
│     ├── Activity
│     └── Account Status
└── Export Customers
```

---

# Customer List Page

Purpose:

Display every registered FinanceOS customer.

This is the default `/admin/customers` page.

---

## Customer List Layout

Page contains:

1. Page Header.
2. KPI Summary.
3. Search & Filters.
4. Customer Table.
5. Pagination.

---

# Customer KPI Cards

Top summary displays **6 KPIs**.

| KPI | Description |
|-----|-------------|
| Total Customers | All registered accounts. |
| Verified Customers | Email verified accounts. |
| Paying Customers | Purchased FinanceOS. |
| New Customers Today | Today's registrations. |
| Active Download Users | Downloaded latest version. |
| Refund Customers | Customers with refunded orders. |

---

# Customer Search System

Global customer search supports:

| Search Field | Example |
|-------------|---------|
| Full Name | Hijaaz Muhammed |
| Email Address | user@example.com |
| Customer ID | CUS-000234 |
| Order ID | ORD-2026-00125 |
| License ID | LIC-000512 |

Search is instant.

---

# Customer Filter System

Filters appear above the table.

## Available Filters

| Filter | Options |
|--------|---------|
| Country | All countries |
| Currency | INR, USD, GBP, EUR |
| Verification Status | Verified / Pending |
| Purchase Status | Paying / Free |
| Current Version | V1.0 / V1.1 / Latest |
| Registration Date | Date range |
| Download Activity | Active / Inactive |

Filters can be combined.

---

# Customer Sorting

Sortable columns.

| Column | Sort |
|--------|------|
| Name | A–Z / Z–A |
| Registration Date | Newest / Oldest |
| Last Active | Recent / Old |
| Total Purchases | High / Low |
| Downloads | High / Low |
| Country | Alphabetical |

---

# Customer Table Specification

Primary customer table.

## Columns

| Column | Description |
|--------|-------------|
| Customer | Avatar + Name |
| Email | Registered email |
| Country | Customer region |
| Purchase Status | Paying / Free |
| Current Version | Latest eligible version |
| Downloads | Download count |
| Last Active | Last dashboard activity |
| Actions | View Profile |

Sticky header required.

---

# Customer Status Badges

| Badge | Meaning |
|-------|---------|
| Verified | Email verified. |
| Pending | Verification pending. |
| Paying | Purchased FinanceOS. |
| Refunded | Refunded purchase. |
| Disabled | Account disabled. |

Shared badge component.

---

# Customer Profile Page

Purpose:

Complete customer information in one place.

Route example:

```text id="gdbhoq"
/admin/customers/CUS-000234
```

---

# Customer Profile Layout

Sections inside profile.

| Tab | Purpose |
|----|---------|
| Overview | Customer summary. |
| Purchases | Orders and invoices. |
| Downloads | Workbook download history. |
| Licenses | Active licenses. |
| Activity | Timeline. |
| Admin Notes | Internal notes (future). |

---

# Customer Overview Tab

Displays identity summary.

## Customer Card

Contains:

- Profile Avatar.
- Full Name.
- Email.
- Customer ID.
- Country.
- Currency.
- Registration Date.
- Verification Badge.

---

# Customer Information Card

| Field | Description |
|------|-------------|
| Customer ID | Unique identifier |
| Email | Login email |
| Country | PPP region |
| Currency | Preferred display currency |
| Signup Date | Account creation |
| Email Verified | Yes / No |
| Last Login | Timestamp |

Read-only.

---

# Purchase Summary Card

Displays purchase overview.

| Field | Description |
|------|-------------|
| Total Purchases | Number of orders |
| Lifetime Spend | Total paid |
| Latest Purchase | Most recent order |
| Current License | Active Version |
| Refund Count | Total refunds |

---

# Customer Purchase History

Shows every purchase.

## Purchase Table

| Column | Description |
|--------|-------------|
| Order ID | Purchase identifier |
| Product | FinanceOS Bundle |
| Date | Purchase date |
| Currency | Purchase currency |
| Amount Paid | Paid amount |
| Gateway | Razorpay / Stripe |
| Status | Completed / Refunded |
| Invoice | Download PDF |

---

# Purchase Detail Drawer

Clicking an order opens side drawer.

Displays:

- Order summary.
- Payment metadata.
- Invoice information.
- License information.
- Download eligibility.

---

# Customer License Center

Shows licenses owned.

## License Card

| Field | Description |
|------|-------------|
| License ID | Unique license |
| Product | FinanceOS Bundle |
| Purchase Version | Version purchased |
| Current Eligible Version | Latest Version 1 |
| Access | Lifetime V1 |
| Status | Active |

---

# License Rules

Version 1 license rules.

| Rule | Value |
|------|-------|
| Devices | Unlimited personal devices |
| Downloads | Unlimited |
| Updates | Free Version 1 updates |
| Expiration | Never expires |

---

# Download History

Purpose:

Track workbook downloads.

## Download Table

| Column | Description |
|--------|-------------|
| Version | Workbook version |
| Platform | Excel / Google Sheets |
| Download Date | Timestamp |
| IP Region | Country only |
| Status | Success / Failed |

No IP addresses displayed.

---

# Download Analytics Card

Customer summary.

| Metric | Description |
|--------|-------------|
| Total Downloads | Lifetime downloads |
| Excel Downloads | Count |
| Google Sheets Copies | Count |
| Latest Download | Timestamp |

---

# Invoice Center

Displays invoices belonging to customer.

## Invoice Table

| Column | Description |
|--------|-------------|
| Invoice Number | Invoice ID |
| Order ID | Linked order |
| Date | Purchase date |
| Amount | Paid amount |
| Currency | Purchase currency |
| Action | Download PDF |

---

# Activity Timeline

Chronological activity log.

## Timeline Events

| Event | Example |
|-------|---------|
| Account Created | Signup |
| Email Verified | Verification complete |
| Purchase Completed | Order completed |
| Workbook Downloaded | Excel download |
| Google Sheets Copied | Template copy |
| Password Reset | Password changed |
| Refund Completed | Refund processed |

Newest first.

---

# Activity Event Card

Every event contains:

- Icon.
- Event title.
- Timestamp.
- Related object.
- Status.

---

# Customer Account Status

Purpose:

Quick account health.

## Status Panel

| Field | Status |
|------|--------|
| Email Verified | Yes / No |
| Account Enabled | Enabled / Disabled |
| Purchase Active | Yes / No |
| Downloads Enabled | Yes / No |
| License Active | Yes / No |

---

# Admin Actions Panel

Admin-only actions.

## Version 1 Actions

| Action | Confirmation Required |
|--------|-----------------------|
| Disable Account | Yes |
| Enable Account | Yes |
| Resend Verification Email | No |
| Reset Customer Password | Yes |
| Send Download Email Again | No |
| Send Invoice Again | No |

---

# Disable Account Flow

```text id="qfdzq0"
Admin Clicks Disable
        │
Confirmation Modal
        │
Account Disabled
        │
Customer Cannot Login
```

Downloads disabled.

---

# Enable Account Flow

Reverse disable flow.

Customer access restored.

---

# Resend Verification Flow

Admin triggers verification email.

System sends new verification email.

Logged in activity timeline.

---

# Password Reset Flow

Admin initiates secure reset email.

Admin never sees customer password.

---

# Customer Export System

Export customer data.

## Export Formats

| Format | Version 1 |
|--------|-----------|
| CSV | Yes |
| Excel | Yes |
| PDF | No |

---

# Export Fields

Export includes:

- Customer ID.
- Name.
- Email.
- Country.
- Registration Date.
- Purchase Status.
- Total Purchases.
- Current Version.

No sensitive authentication data exported.

---

# Customer Notes (Future)

Reserved for Version 2.

Allows internal support notes.

Not included in Version 1.

---

# Customer Tags (Future)

Reserved.

Examples:

- VIP.
- Beta Tester.
- Refund Risk.
- Affiliate.

---

# Pagination Rules

Customer table pagination.

Default:

- 25 customers/page.

Options:

- 25
- 50
- 100

---

# Empty States

Examples.

## No Customers

"No customers found."

## No Purchases

"This customer hasn't purchased FinanceOS yet."

## No Downloads

"No workbook downloads recorded."

---

# Loading States

Skeleton loaders for:

- Customer table.
- Profile.
- Purchases.
- Downloads.
- Timeline.

---

# Responsive Behavior

## Desktop

Full table layout.

## Tablet

Reduced columns.

## Mobile

Customer cards replace table rows.

---

# Accessibility Rules

Customer module supports:

- Keyboard navigation.
- Accessible tables.
- Focus indicators.
- Screen reader labels.
- Accessible timeline.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Customer Search | Under 300ms |
| Customer Profile Load | Under 800ms |
| Filter Refresh | Under 500ms |
| Export Generation | Under 3 seconds |

---

# Customer Database Fields

Customer module references:

## Customer Table

| Field | Purpose |
|------|---------|
| Customer ID | Primary identifier |
| Email | Login |
| Name | Display |
| Country | PPP |
| Currency | Purchases |
| Created At | Signup |
| Verified At | Email verification |
| Last Login | Activity |

## Purchase Metadata

| Field | Purpose |
|------|---------|
| Orders | Purchase history |
| Licenses | Product ownership |
| Downloads | Download history |
| Refunds | Refund history |

---

# Cursor Components

Reusable customer components.

| Component | Used In |
|-----------|---------|
| CustomerTable | Customer List |
| CustomerCard | Mobile List |
| CustomerProfileHeader | Profile |
| PurchaseTable | Purchases |
| DownloadTable | Downloads |
| InvoiceTable | Invoices |
| Timeline | Activity |
| StatusPanel | Overview |
| AdminActionPanel | Customer Actions |

---

# Cursor Implementation Rules

Cursor must:

1. Build searchable customer database.
2. Create reusable customer profile layout.
3. Support purchase and invoice tables.
4. Support download history timeline.
5. Support admin actions.
6. Protect sensitive customer information.
7. Export customer data.
8. Maintain responsive table/card layouts.

---

# Frozen Decisions (Version 1)

The following Customer Management decisions are locked.

- Unified customer profile.
- Global customer search.
- Multi-filter customer table.
- Purchase history inside profile.
- License center inside profile.
- Download history timeline.
- Email verification management.
- Secure password reset flow.
- CSV/Excel export.
- Customer financial workbook data never visible.

---

# Version History

## Version 1.0

Official FinanceOS Customer Management specification defining customer database architecture, search and filters, customer profiles, purchases, licenses, downloads, invoices, activity timeline, admin actions, exports, accessibility, performance targets, and Cursor implementation rules.

---

**End of Document**

**File:** `02_CUSTOMER_MANAGEMENT.md`
