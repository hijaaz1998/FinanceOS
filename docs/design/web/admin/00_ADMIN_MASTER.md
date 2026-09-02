# 00_ADMIN_MASTER.md

## FinanceOS — Admin Portal Master Architecture Specification

**Document ID:** WEB-ADMIN-00

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Admin Portal Architecture)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

This document is the master specification for the entire FinanceOS Admin Portal.

### Required Documents

- `docs/web/user/00_WEB_MASTER.md`
- `docs/web/user/07_PRICING_AND_PPP_SYSTEM.md`
- `docs/web/user/08_AUTH_AND_USER_ACCOUNTS.md`
- `docs/web/user/09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`
- `docs/design/02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the complete architecture, philosophy, navigation, permissions, workflows, and responsibilities of the FinanceOS Admin Portal.

The Admin Portal is the internal operating system used to manage the FinanceOS business.

It is responsible for:

- Customers.
- Orders.
- Payments.
- Product releases.
- Coupons.
- Downloads.
- Emails.
- Analytics.
- Content management.
- Security.

This document is the **single source of truth** for Cursor when building the internal admin application.

---

# Admin Portal Philosophy

FinanceOS Admin Portal follows one principle:

> **Every operational task required to run FinanceOS should be managed from one centralized dashboard.**

The admin portal is **not** a public website.

It is an authenticated internal application for business operations.

---

# Admin Portal Objectives

| Objective | Purpose |
|-----------|---------|
| Customer Management | Manage every FinanceOS customer account. |
| Revenue Management | Track orders, payments, refunds, coupons, and revenue. |
| Product Delivery | Upload and distribute workbook releases. |
| Download Management | Control downloadable assets and versions. |
| Marketing Operations | Monitor campaigns, conversions, and acquisition. |
| Business Analytics | View growth and operational metrics. |
| Security | Protect administrative access and audit actions. |

---

# Admin Portal Scope (Version 1)

Version 1 includes internal tools only.

## Included

- Customer Dashboard
- Order Management
- License Management
- Payment Dashboard
- Coupon Management
- Product Release Center
- Email Center
- Analytics Dashboard
- Content Library
- Admin Settings
- Security & Roles

## Not Included

- AI customer support.
- CRM integrations.
- Affiliate dashboard.
- Team collaboration.
- Inventory management.
- Multi-product marketplace.

Reserved for Version 2.

---

# Admin Portal Architecture

```text
Admin Login
      │
      ▼
Admin Dashboard
      │
      ├── Customers
      ├── Orders
      ├── Products
      ├── Payments
      ├── Coupons
      ├── Releases
      ├── Emails
      ├── Analytics
      ├── Content
      └── Settings
```

Everything is accessible through one authenticated application.

---

# Admin Portal Modules

The Admin Portal contains **10 primary modules**.

| Module | Purpose |
|--------|---------|
| Dashboard Overview | Business summary and KPIs. |
| Customer Management | Customers, accounts, downloads. |
| Order Management | Purchases, invoices, refunds. |
| Product Release Center | Workbook versions and releases. |
| Payment & Coupon Center | Revenue and discounts. |
| Email Center | Transactional emails and notifications. |
| Analytics Dashboard | Sales, downloads, growth. |
| Content Library | Images, creatives, product assets. |
| Security & Roles | Authentication and permissions. |
| Admin Settings | System configuration. |

Each module receives its own specification document.

---

# Admin Dashboard Philosophy

The dashboard answers three questions immediately.

1. How is FinanceOS performing today?
2. Is anything broken?
3. Is there any action required?

No unnecessary widgets.

---

# Primary Dashboard KPIs

Top dashboard contains **8 KPI cards**.

| KPI | Description |
|-----|-------------|
| Total Revenue | Lifetime revenue. |
| Today's Revenue | Revenue generated today. |
| Active Customers | Verified customers. |
| Orders Today | Purchases today. |
| Downloads Today | Workbook downloads today. |
| Current Workbook Version | Latest published version. |
| Conversion Rate | Website purchase conversion. |
| Refund Rate | Refund percentage. |

These KPIs are frozen.

---

# Dashboard Widgets

Dashboard contains operational widgets.

| Widget | Purpose |
|--------|---------|
| Revenue Trend | Daily revenue chart. |
| Recent Orders | Latest purchases. |
| Pending Refunds | Refund requests. |
| Latest Customers | Newly registered customers. |
| Latest Downloads | Recent download activity. |
| Version Status | Current release information. |
| Coupon Performance | Active coupon usage. |
| Website Health | Payment/API status. |

---

# Admin Navigation Structure

Desktop sidebar navigation.

```text
Overview
Customers
Orders
Products
Payments
Coupons
Emails
Analytics
Content Library
Settings
Logout
```

Sidebar remains fixed.

---

# Global Search System

Admin includes universal search.

Searchable entities:

- Customer Name.
- Customer Email.
- Order ID.
- License ID.
- Coupon Code.
- Invoice Number.
- Workbook Version.

Search available from every page.

---

# Global Filter System

Reusable filters.

| Filter | Used In |
|--------|----------|
| Date Range | Orders, Revenue |
| Country | Customers |
| Currency | Revenue |
| Status | Orders |
| Version | Downloads |
| Payment Gateway | Payments |

Shared filter component across portal.

---

# Admin UI Design Language

Admin portal follows the FinanceOS Design System.

### Uses

- Same typography.
- Same spacing tokens.
- Same color palette.
- Same button styles.
- Same table system.
- Same KPI card system.

Admin receives its own navigation styling.

---

# Permission Model

Version 1 supports one role.

## Super Admin

Full access.

Future roles reserved.

| Future Role | Version |
|-------------|---------|
| Support Admin | V2 |
| Marketing Admin | V2 |
| Finance Admin | V2 |
| Read-Only Admin | V2 |

---

# Authentication Rules

Admin authentication is separate from customer authentication.

Requirements:

- Admin email whitelist.
- Supabase authentication.
- Protected admin routes.
- Session timeout.
- Audit logging.

Customer accounts cannot access admin routes.

---

# Admin Route Structure

```text
/admin
/admin/customers
/admin/orders
/admin/products
/admin/payments
/admin/coupons
/admin/releases
/admin/emails
/admin/analytics
/admin/content
/admin/settings
```

Routes are protected.

---

# Product Management Philosophy

Admin manages **FinanceOS releases**, not workbook editing.

Admin uploads finished workbook builds.

Portal distributes releases automatically.

---

# Customer Lifecycle (Admin View)

```text
Visitor
   │
Signup
   │
Purchase
   │
Customer
   │
Download
   │
Version Update
   │
Lifetime Customer
```

Entire lifecycle visible inside admin.

---

# Order Lifecycle (Admin View)

```text
Checkout Started
      │
Payment Processing
      │
Payment Success
      │
License Generated
      │
Downloads Enabled
      │
Invoice Generated
```

Refund flow branches afterward.

---

# Release Lifecycle

```text
Workbook Completed
        │
Upload Release
        │
Publish Version
        │
Notify Customers
        │
Downloads Updated
```

Single release updates all eligible customers.

---

# Coupon Lifecycle

```text
Draft
 │
Active
 │
Used
 │
Expired
 │
Archived
```

Coupons never deleted permanently.

---

# Email Lifecycle

```text
Template Created
        │
Trigger Event
        │
Queued
        │
Sent
        │
Delivered
```

Email logs stored.

---

# Analytics Philosophy

Admin analytics focus on business operations.

Questions answered:

- Revenue.
- Conversion.
- Downloads.
- Customer acquisition.
- Refunds.
- Coupon effectiveness.

No spreadsheet financial analytics collected.

---

# Data Ownership Rules

Admin can access:

- Customer profile.
- Orders.
- Downloads.
- Licenses.
- Email status.

Admin **cannot** access workbook financial data entered by customers.

Privacy boundary is frozen.

---

# File Management Philosophy

Admin manages downloadable assets.

Types:

- Excel workbook.
- Google Sheets template.
- Release notes.
- Social images.
- Product screenshots.

Everything versioned.

---

# Notification System

Internal admin notifications include:

- Payment failed.
- New release published.
- Refund requested.
- Download issue detected.
- Email delivery failure.

Operational alerts only.

---

# Audit Logging Philosophy

Every important admin action is recorded.

Examples:

- Publish release.
- Refund order.
- Create coupon.
- Delete coupon.
- Change settings.
- Login.
- Logout.

Audit logs are immutable.

---

# Admin Dashboard Layout

Desktop layout.

| Area | Width |
|------|-------|
| Sidebar | 280px |
| Header | Fixed |
| Content | Flexible |
| Notification Drawer | Optional right panel |

Shared across all pages.

---

# Mobile Admin Rules

Admin supports mobile viewing.

Capabilities:

- Dashboard KPIs.
- Orders.
- Customers.
- Analytics.

Publishing releases recommended on desktop.

---

# Performance Targets

| Page | Target |
|------|--------|
| Dashboard Load | Under 2 seconds |
| Orders Page | Under 1 second |
| Customer Search | Under 300ms |
| Analytics Refresh | Under 1 second |

---

# Accessibility Targets

Admin follows WCAG AA.

Requirements:

- Keyboard navigation.
- Accessible tables.
- Accessible charts.
- Screen reader labels.
- Focus indicators.

---

# Security Principles

Admin application must implement:

- HTTPS only.
- Protected routes.
- Session expiration.
- Audit logs.
- Role verification.
- Secure environment variables.

---

# Admin Folder Documentation Map

| File | Responsibility |
|------|----------------|
| `00_ADMIN_MASTER.md` | Admin architecture. |
| `01_ADMIN_LAYOUT_AND_NAVIGATION.md` | UI and layout. |
| `02_CUSTOMER_MANAGEMENT.md` | Customer system. |
| `03_ORDER_AND_LICENSE_MANAGEMENT.md` | Orders and licenses. |
| `04_PRODUCT_RELEASE_MANAGEMENT.md` | Version publishing. |
| `05_PAYMENT_AND_COUPON_SYSTEM.md` | Payments and coupons. |
| `06_EMAIL_AND_NOTIFICATION_CENTER.md` | Email operations. |
| `07_ANALYTICS_AND_GROWTH_DASHBOARD.md` | Analytics portal. |
| `08_CONTENT_AND_MEDIA_LIBRARY.md` | Assets and media. |
| `09_ADMIN_SECURITY_AND_ROLES.md` | Authentication and permissions. |
| `10_ADMIN_IMPLEMENTATION_CHECKLIST.md` | Cursor build checklist. |

---

# Cursor Implementation Principles

Cursor must:

1. Build Admin as a separate application inside `/admin`.
2. Reuse FinanceOS Design System components.
3. Protect all admin routes.
4. Keep customer dashboard completely separate.
5. Build reusable tables, filters, charts, and forms.
6. Connect modules through shared backend APIs.
7. Record audit logs for sensitive actions.
8. Support future admin roles without redesign.

---

# Frozen Decisions (Version 1)

The following Admin Portal decisions are locked.

- Separate admin application.
- Sidebar navigation architecture.
- Super Admin role only.
- Shared FinanceOS Design System.
- Central customer/order/payment management.
- Product release management inside admin.
- Email center inside admin.
- Analytics dashboard inside admin.
- Audit logging enabled.
- Customer financial workbook data never visible.

---

# Version History

## Version 1.0

Official FinanceOS Admin Portal master specification defining architecture, navigation, modules, permissions, workflows, dashboard KPIs, operational philosophy, security boundaries, audit logging, performance targets, accessibility, and Cursor implementation principles.

---

**End of Document**

**File:** `00_ADMIN_MASTER.md`
