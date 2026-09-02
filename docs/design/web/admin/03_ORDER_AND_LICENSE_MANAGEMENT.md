# 03_ORDER_AND_LICENSE_MANAGEMENT.md

## FinanceOS — Order, License, Invoice & Refund Management Specification

**Document ID:** WEB-ADMIN-03

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Order & License Management System)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `01_ADMIN_LAYOUT_AND_NAVIGATION.md`
- `02_CUSTOMER_MANAGEMENT.md`
- `docs/web/user/07_PRICING_AND_PPP_SYSTEM.md`
- `docs/web/user/08_AUTH_AND_USER_ACCOUNTS.md`
- `docs/web/user/09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `docs/web/user/10_CUSTOMER_DASHBOARD.md`
- `docs/design/00_DESIGN_MASTER.md`

---

# Purpose

This document defines the complete **Order Management, License Management, Invoice Management, Refund Processing, and Download Eligibility System** inside the FinanceOS Admin Portal.

This module allows administrators to:

- View all customer orders.
- Verify payment status.
- Manage invoices.
- Manage customer licenses.
- Process refunds.
- Restore downloads.
- Track payment gateway events.
- Monitor order lifecycle.

This document is the **single source of truth** for Cursor when implementing order operations.

---

# Order Management Philosophy

Every successful payment creates a permanent ownership record.

An order connects four systems:

- Customer
- Payment
- License
- Downloads

These records must always remain synchronized.

---

# Order Lifecycle Architecture

```text
Checkout Started
        │
Payment Processing
        │
Payment Successful
        │
Webhook Verification
        │
Order Created
        │
License Generated
        │
Invoice Generated
        │
Downloads Enabled
```

This lifecycle is frozen.

---

# Order Module Overview

| Section | Purpose |
|--------|---------|
| Orders Dashboard | Overview of all orders. |
| Orders Table | Master order database. |
| Order Details | Complete order information. |
| License Center | Customer licenses. |
| Invoice Center | Invoice management. |
| Refund Center | Refund processing. |
| Payment Logs | Gateway verification logs. |
| Download Eligibility | Product access management. |

---

# Orders Dashboard

Top dashboard displays business KPIs.

## KPI Cards

| KPI | Description |
|-----|-------------|
| Total Orders | Lifetime completed orders. |
| Today's Orders | Orders created today. |
| Successful Payments | Completed purchases. |
| Failed Payments | Failed transactions. |
| Refund Requests | Pending refunds. |
| Total Refunds | Completed refunds. |
| Active Licenses | Valid licenses. |
| Downloads Enabled | Customers with access. |

---

# Orders Table

Master order database.

## Columns

| Column | Description |
|--------|-------------|
| Order ID | Unique order identifier. |
| Customer | Customer name. |
| Email | Purchase email. |
| Product | FinanceOS Bundle. |
| Amount Paid | Final payment amount. |
| Currency | Purchase currency. |
| Gateway | Razorpay / Stripe. |
| Status | Order status badge. |
| Purchase Date | Timestamp. |
| Actions | View Order. |

Sticky header required.

---

# Order Status System

Version 1 supports six order states.

| Status | Meaning |
|--------|---------|
| Pending | Checkout initiated. |
| Processing | Payment verification running. |
| Completed | Purchase successful. |
| Failed | Payment failed. |
| Refunded | Refund completed. |
| Cancelled | Checkout cancelled before payment. |

Status badges reuse shared component.

---

# Order Search System

Search supports:

| Search | Example |
|--------|---------|
| Order ID | ORD-2026-000125 |
| Customer Name | Hijaaz Muhammed |
| Email | user@example.com |
| Invoice Number | INV-2026-000125 |
| License ID | LIC-2026-000125 |

Instant search across all orders.

---

# Order Filter System

Filters include:

| Filter | Options |
|--------|---------|
| Date Range | Purchase period |
| Status | Completed / Failed / Refunded |
| Gateway | Razorpay / Stripe |
| Country | Purchase region |
| Currency | INR / USD / GBP / EUR |
| Product Version | V1.0 / V1.1 / Latest |

Filters can be combined.

---

# Order Detail Page

Route example:

```text
/admin/orders/ORD-2026-000125
```

Complete order record.

---

# Order Detail Layout

Sections:

| Section | Purpose |
|--------|---------|
| Order Summary | Core purchase info. |
| Customer | Linked customer profile. |
| Payment | Gateway transaction info. |
| License | Generated license. |
| Invoice | Download invoice. |
| Downloads | Customer eligibility. |
| Timeline | Order events. |

---

# Order Summary Card

Displays:

| Field | Description |
|------|-------------|
| Order ID | Primary identifier |
| Purchase Date | Timestamp |
| Product | FinanceOS Bundle |
| Version Purchased | Version at purchase |
| Current Eligible Version | Latest Version 1 |
| Status | Completed / Refunded |

---

# Customer Card

Displays linked customer information.

| Field | Description |
|------|-------------|
| Customer Name | Full name |
| Customer ID | Linked profile |
| Email | Purchase email |
| Country | PPP region |
| Currency | Purchase currency |

Clickable profile shortcut.

---

# Payment Information Card

Displays gateway metadata.

| Field | Description |
|------|-------------|
| Payment Gateway | Razorpay / Stripe |
| Gateway Payment ID | Transaction ID |
| Gateway Order ID | Provider order ID |
| Amount Paid | Final amount |
| Currency | Purchase currency |
| Payment Status | Success / Failed |
| Verification Status | Verified |

Read-only metadata.

---

# Payment Verification Rules

Verification requires:

- Gateway signature valid.
- Payment amount matches order.
- Currency matches.
- Customer matches.
- Product matches.

Order cannot complete without verification.

---

# Payment Event Timeline

Timeline contains gateway events.

Examples:

- Checkout Started.
- Payment Authorized.
- Payment Captured.
- Payment Failed.
- Payment Refunded.

Chronological order.

---

# License Management Center

Purpose:

Manage product ownership.

---

## License Overview

Every completed order creates one license.

License tied to customer account.

---

## License Table

| Column | Description |
|--------|-------------|
| License ID | Unique identifier |
| Customer | Linked customer |
| Product | FinanceOS Bundle |
| Version Purchased | Original version |
| Current Eligible Version | Latest available version |
| Status | Active / Revoked |
| Created Date | Timestamp |

---

# License Status System

| Status | Meaning |
|--------|---------|
| Active | Customer owns product. |
| Revoked | Downloads disabled. |
| Refunded | License revoked after refund. |
| Archived | Historical license. |

---

# License Detail Drawer

Displays:

- License metadata.
- Linked customer.
- Linked order.
- Downloads enabled.
- Current eligible version.

---

# License Rules

Version 1 policy.

| Rule | Value |
|------|-------|
| Lifetime Ownership | Yes |
| Unlimited Downloads | Yes |
| Version 1 Updates | Free |
| Device Limit | Unlimited personal devices |

---

# Download Eligibility Management

Purpose:

Control customer download access.

---

## Eligibility States

| State | Meaning |
|------|---------|
| Enabled | Downloads available. |
| Disabled | Downloads blocked. |
| Revoked | License revoked. |

---

## Admin Download Actions

| Action | Confirmation |
|--------|--------------|
| Enable Downloads | No |
| Disable Downloads | Yes |
| Restore Downloads | No |
| Resend Download Email | No |

---

# Download Restore Flow

```text
Admin Restores Downloads
        │
License Active
        │
Downloads Enabled
        │
Email Notification Sent
```

---

# Invoice Management Center

Purpose:

Manage invoices.

---

## Invoice Table

| Column | Description |
|--------|-------------|
| Invoice Number | Unique invoice ID |
| Order ID | Linked order |
| Customer | Customer name |
| Amount | Invoice total |
| Currency | Purchase currency |
| Created Date | Timestamp |
| Action | Download PDF |

---

# Invoice Detail Drawer

Displays:

- Invoice preview.
- Customer billing details.
- Purchase summary.
- Tax summary.
- Download PDF.

---

# Invoice Rules

Version 1 invoices:

- Generated automatically.
- Never expire.
- Unlimited downloads.
- Linked permanently to order.

---

# Refund Management Center

Purpose:

Manage refunds.

---

## Refund Dashboard

Displays:

| KPI | Description |
|-----|-------------|
| Pending Refunds | Waiting approval |
| Approved Refunds | Completed refunds |
| Refund Amount | Total refunded revenue |
| Refund Rate | Percentage |

---

## Refund Table

| Column | Description |
|--------|-------------|
| Refund ID | Unique refund identifier |
| Order ID | Linked order |
| Customer | Customer name |
| Amount | Refunded amount |
| Gateway | Stripe / Razorpay |
| Status | Pending / Completed |
| Requested Date | Timestamp |

---

# Refund Workflow

```text
Refund Requested
        │
Admin Reviews
        │
Approve / Reject
        │
Gateway Refund
        │
Order Updated
        │
License Updated
```

---

# Refund Approval Modal

Shows:

- Customer.
- Order.
- Amount.
- Currency.
- Refund reason.
- Confirmation button.

Requires confirmation.

---

# Refund Consequences

After successful refund:

- Order status becomes Refunded.
- License revoked.
- Downloads disabled.
- Refund event added to timeline.
- Customer notified.

---

# Failed Payment Management

Purpose:

Monitor incomplete purchases.

---

## Failed Payment Table

| Column | Description |
|--------|-------------|
| Attempt ID | Payment attempt |
| Customer | Email |
| Gateway | Stripe / Razorpay |
| Failure Reason | Gateway response |
| Timestamp | Attempt date |
| Retry Status | Pending / Completed |

---

# Payment Retry Rules

Customers retry through checkout.

Admin cannot manually complete payments.

---

# Gateway Event Logs

Purpose:

Audit payment gateway events.

---

## Razorpay Event Types

- Payment Authorized.
- Payment Captured.
- Payment Failed.
- Refund Created.

---

## Stripe Event Types

- Checkout Completed.
- Payment Succeeded.
- Payment Failed.
- Refund Created.

---

# Order Timeline

Complete order activity history.

Events include:

- Checkout started.
- Payment verified.
- Order created.
- Invoice generated.
- Download enabled.
- Refund processed.

Immutable timeline.

---

# Bulk Order Actions

Bulk actions available.

| Action | Applies To |
|--------|------------|
| Export Orders | Selected orders |
| Resend Invoice | Completed orders |
| Resend Download Email | Completed orders |
| Archive Failed Orders | Failed orders |

Refunds cannot be bulk processed.

---

# Order Export System

Supported exports.

| Format | Version 1 |
|--------|-----------|
| CSV | Yes |
| Excel | Yes |
| PDF | No |

---

# Export Fields

Export includes:

- Order ID.
- Customer.
- Email.
- Country.
- Currency.
- Amount.
- Gateway.
- Status.
- Purchase Date.

---

# Empty States

Examples.

## No Orders

"No orders found."

## No Refunds

"No refund requests."

## No Failed Payments

"No failed payments detected."

---

# Loading States

Skeleton loaders for:

- Orders table.
- Refund table.
- License table.
- Invoice drawer.
- Order timeline.

---

# Responsive Behavior

## Desktop

Full tables.

## Tablet

Reduced columns.

## Mobile

Order cards replace table rows.

Drawers become full-screen sheets.

---

# Accessibility Rules

Module supports:

- Accessible tables.
- Keyboard navigation.
- Focus management.
- Screen reader labels.
- Accessible timeline.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Order Search | Under 300ms |
| Order Detail Load | Under 700ms |
| Refund Approval | Under 1 second |
| Invoice Download | Under 2 seconds |

---

# Database Fields Referenced

## Orders

| Field | Purpose |
|------|---------|
| Order ID | Primary identifier |
| Customer ID | Relationship |
| Payment Gateway | Metadata |
| Currency | Purchase |
| Amount | Payment |
| Status | Lifecycle |
| Created At | Timestamp |

## Licenses

| Field | Purpose |
|------|---------|
| License ID | Ownership |
| Version Purchased | Purchase record |
| Current Eligible Version | Updates |
| Download Enabled | Access |
| Status | License state |

---

# Cursor Components

Reusable components.

| Component | Used In |
|-----------|---------|
| OrdersTable | Orders page |
| OrderHeader | Detail page |
| PaymentCard | Order details |
| LicenseTable | License center |
| InvoiceTable | Invoice center |
| RefundTable | Refund center |
| Timeline | Order history |
| StatusBadge | Orders |
| RefundModal | Refund workflow |

---

# Cursor Implementation Rules

Cursor must:

1. Build reusable order table.
2. Connect orders to customers.
3. Build license management center.
4. Build invoice management.
5. Build refund workflow.
6. Build payment event timeline.
7. Build download eligibility controls.
8. Protect refund actions with confirmation.

---

# Frozen Decisions (Version 1)

The following Order & License decisions are locked.

- One completed payment creates one license.
- Lifetime Version 1 license policy.
- Unlimited download eligibility.
- Invoice generation after payment verification.
- Refund revokes downloads.
- Immutable payment timeline.
- Separate refund center.
- CSV/Excel exports only.
- Gateway verification required before order completion.

---

# Version History

## Version 1.0

Official FinanceOS Order & License Management specification defining order lifecycle, payment verification, licenses, invoices, refunds, download eligibility, gateway logs, exports, accessibility, performance targets, and Cursor implementation standards.

---

**End of Document**

**File:** `03_ORDER_AND_LICENSE_MANAGEMENT.md`
