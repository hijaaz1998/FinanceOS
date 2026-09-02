# 10_CUSTOMER_DASHBOARD.md

## FinanceOS — Customer Dashboard & Download Portal Specification

**Document ID:** WEB-USER-10

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Customer Dashboard Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

---

## Dependencies

- `00_WEB_MASTER.md`
- `08_AUTH_AND_USER_ACCOUNTS.md`
- `09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `07_PRICING_AND_PPP_SYSTEM.md`
- `/docs/design/00_DESIGN_MASTER.md`
- `/docs/design/01_DESIGN_SYSTEM.md`
- `/docs/design/02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the complete **Customer Dashboard** experience after purchasing FinanceOS.

The dashboard is the customer's private portal where they can:

- Download purchased FinanceOS products.
- Access future Version 1 updates.
- View invoices and purchase history.
- Manage account settings.
- Receive product update notifications.
- Access installation guides and support.

**This is NOT the FinanceOS spreadsheet dashboard.**

**This is NOT the Admin Dashboard.**

This document is the single source of truth for Cursor when building the customer portal.

---

# Dashboard Philosophy

FinanceOS Customer Dashboard follows the design language of:

- Stripe Customer Portal.
- Gumroad Library.
- Notion Settings.
- Apple Account Downloads.

The dashboard communicates one idea:

> **Everything you own is available here forever.**

---

# Dashboard Goals

| Goal | Purpose |
|------|---------|
| **Product Ownership** | Show purchased FinanceOS products. |
| **Downloads** | Access Excel & Google Sheets anytime. |
| **Version Updates** | Notify customers whenever a new Version 1 release is available. |
| **Purchase History** | Display all previous FinanceOS purchases and order details. |
| **Invoices** | Allow customers to download invoices anytime. |
| **Account Management** | Manage profile, password, country, and notification settings. |
| **Support Access** | Give customers quick access to installation guides, FAQs, and support. |
| **Future Products** | Showcase upcoming FinanceOS ecosystem products available to existing customers. |

---

# Dashboard Architecture

The Customer Dashboard contains **8 major modules**.

| Module | Purpose |
|---------|---------|
| Welcome Dashboard | Customer overview. |
| Product Library | Purchased products. |
| Download Center | Excel & Google Sheets downloads. |
| Updates Center | New workbook versions. |
| Orders & Invoices | Purchase history. |
| Account Settings | Profile & security. |
| Support Center | Help resources. |
| Future Products | Upcoming ecosystem products. |

---

# Dashboard Route Structure

```text
/dashboard
│
├── Overview
├── Downloads
├── Orders
├── Updates
├── Account
├── Support
└── Logout
```

Each page uses the same sidebar layout.

---

# Folder Structure (Cursor)

```text
/app/dashboard/
│
├── page.tsx
├── downloads/
├── orders/
├── updates/
├── support/
├── account/
└── components/
    ├── Sidebar.tsx
    ├── WelcomeHeader.tsx
    ├── ProductCard.tsx
    ├── DownloadCard.tsx
    ├── UpdateBanner.tsx
    ├── InvoiceCard.tsx
    ├── NotificationBanner.tsx
    └── EmptyState.tsx
```

Cursor must keep dashboard components isolated from website components.

---

# Dashboard Layout Specification

## Desktop Layout

**Three-part application layout**

| Area | Width |
|------|-------|
| Sidebar | 280px |
| Main Content | Flexible |
| Optional Right Panel | 320px (future use) |

Sidebar remains sticky.

---

## Tablet Layout

Sidebar collapses.

Navigation becomes drawer.

Content becomes full width.

---

## Mobile Layout

Bottom navigation replaces sidebar.

Tabs:

- Home
- Downloads
- Orders
- Account

Support accessible from Account page.

---

# Welcome Dashboard

Purpose:

Provide customers with an overview immediately after login.

---

## Welcome Header

Displays:

- Customer name.
- Welcome message.
- Purchase date.
- Current FinanceOS version.
- Latest version badge.

Example:

> Welcome back, Hijaaz.

FinanceOS Version 1.2 is available.

---

## Summary Cards

Four KPI-style cards.

| Card | Description |
|------|-------------|
| Products Owned | FinanceOS Complete Bundle |
| Downloads Available | Excel + Google Sheets |
| Current Version | Latest eligible version |
| Purchase Date | Original purchase timestamp |

Cards reuse KPI component styling from Design System.

---

# Product Library

Purpose:

Display everything owned by the customer.

Version 1 contains one product but architecture supports expansion.

---

## Product Card Layout

Every product card contains:

### Header

- Product cover image.
- FinanceOS Complete Bundle.

### Metadata

| Field | Example |
|-------|---------|
| Product Version | V1.2 |
| Purchase Region | India |
| Purchase Currency | INR |
| Purchase Date | 15 June 2026 |
| Access | Lifetime Access |

### Actions

- Download Excel.
- Open Google Sheets.
- Release Notes.

---

## Product Status Badges

Possible badges.

| Badge | Meaning |
|-------|---------|
| Purchased | Customer owns product. |
| Latest Version | Up to date. |
| Update Available | New download available. |
| Coming Soon | Future ecosystem products. |

---

# Download Center

Purpose:

Primary destination after purchase.

---

## Download Center Layout

Desktop uses card grid.

| Card | Purpose |
|------|---------|
| Excel Workbook | Download latest workbook. |
| Google Sheets Template | Create personal copy. |
| Release Notes | What's new. |
| Installation Guide | Setup instructions. |

---

## Excel Download Card

Displays:

| Field | Example |
|------|---------|
| Workbook Version | FinanceOS V1.2 |
| Platform | Microsoft Excel |
| File Size | 6.8 MB |
| Release Date | 12 July 2026 |
| Status | Latest Version |

Primary CTA:

**Download Workbook**

---

## Google Sheets Download Card

Displays:

| Field | Example |
|------|---------|
| Version | V1.2 |
| Platform | Google Sheets |
| Setup | Create Personal Copy |
| Status | Latest Version |

CTA:

**Open Google Sheets Copy**

---

## Download Button States

| State | UI |
|------|----|
| Ready | Download Workbook |
| Preparing | Preparing Download... |
| Downloading | Spinner + Progress |
| Success | Download Complete |
| Update Available | Download Latest Version |

---

## Download History Card

Displays previous downloads.

| Field | Description |
|------|-------------|
| Workbook Version | Downloaded version |
| Platform | Excel / Google Sheets |
| Download Date | Timestamp |
| Action | Download Again |

History is informational only.

---

# Version Updates Center

Purpose:

Deliver future Version 1 updates.

---

## Update Banner

Large notification appears on dashboard.

Example:

**FinanceOS Version 1.3 is Available**

Includes:

- What's New.
- Download Update button.
- Release Date.

Dismissible after download.

---

## Version Timeline

Newest version appears first.

| Version | Release Date | Status |
|---------|--------------|--------|
| V1.3 | July 2026 | Available |
| V1.2 | June 2026 | Downloaded |
| V1.1 | May 2026 | Previous Version |
| V1.0 | Launch | Original Purchase |

---

## Release Notes Card

Every release includes:

### Summary

One paragraph describing improvements.

### New Features

Checklist.

### Improvements

Checklist.

### Bug Fixes

Checklist.

### Download Button

Download latest workbook.

---

## Update Eligibility Rules

Customer receives update if:

- Owns Version 1.
- Update released.
- Update not downloaded.

No payment required.

---

# Orders & Purchase History

Purpose:

View purchase records.

---

## Orders Table

| Column | Description |
|--------|-------------|
| Order ID | Unique purchase ID |
| Product | FinanceOS Bundle |
| Purchase Date | Timestamp |
| Currency | INR / USD / GBP |
| Amount Paid | Purchase price |
| Status | Completed / Refunded |
| Invoice | Download PDF |

Newest orders first.

---

## Invoice Center

Each invoice card contains:

- Invoice Number.
- Purchase Date.
- Currency.
- Amount Paid.
- Download PDF button.

Invoices remain permanently available.

---

## Invoice Download Rules

Invoices generated once.

Customer may download unlimited times.

PDF filename example:

```text
FinanceOS_Invoice_INV-2026-000012.pdf
```

---

# Account Settings

Purpose:

Customer profile management.

---

## Settings Layout

Four settings cards.

| Card | Purpose |
|------|---------|
| Personal Information | Profile details |
| Security | Password management |
| Country & Currency | Region preferences |
| Notification Preferences | Email preferences |

---

## Personal Information Card

Editable fields.

| Field | Editable |
|------|----------|
| Full Name | Yes |
| Email Address | Yes (verification required) |
| Country | Yes |
| Account Created | Read Only |

---

## Security Card

Contains:

- Change Password.
- Password Strength Indicator.
- Last Password Change.
- Logout.

Future:

Logout Everywhere.

---

## Country & Currency Card

Displays:

| Setting | Description |
|---------|-------------|
| Country | Current region |
| Currency | Display currency |
| PPP Region | Active pricing region |

Changing country affects future purchases only.

---

## Notification Preferences

Email notification toggles.

| Notification | Default |
|-------------|---------|
| Version Updates | Enabled |
| Security Emails | Enabled |
| Product Announcements | Disabled |
| Marketing Emails | Disabled |

---

# Support Center

Purpose:

Reduce customer support requests.

---

## Support Dashboard Layout

Cards include:

- Installation Guide.
- Frequently Asked Questions.
- Troubleshooting.
- Contact Support.

---

## Installation Guide Card

Two setup guides.

### Excel Setup

1. Download workbook.
2. Enable editing.
3. Save local copy.

### Google Sheets Setup

1. Open template.
2. Create copy.
3. Save in Google Drive.

---

## Troubleshooting Cards

Common issues.

| Issue | Help |
|------|------|
| Workbook won't open | Excel troubleshooting |
| Google Sheets copy failed | Copy permissions |
| Missing download | Restore purchase |
| Wrong account | Account recovery |

---

## Contact Support Card

Displays:

- Support email.
- Average response time.
- Include Order ID reminder.

Version 1 uses email support only.

---

# Notification Center

Purpose:

Customer alerts.

---

## Notification Types

| Type | Example |
|------|----------|
| Success | Workbook Downloaded |
| Update | Version 1.3 Available |
| Security | Password Changed |
| Account | Email Verified |

Notifications appear as top banners.

---

## Notification Behavior

- Auto-dismiss success messages.
- Update banners remain until dismissed.
- Security notifications remain visible once.

---

# Future Products Section

Purpose:

Preview ecosystem roadmap.

---

## Future Product Cards

| Product | Status |
|----------|--------|
| FinanceOS Mobile App | Coming Soon |
| AI Finance Assistant | Coming Soon |
| SMS Expense Automation | Coming Soon |
| Cloud Sync | Coming Soon |
| Premium Prediction Engine | Coming Soon |

No purchase buttons in Version 1.

---

# Empty Dashboard State

If customer has no purchases.

Displays:

- Illustration.
- Message.
- Buy FinanceOS CTA.

Prevents blank dashboard.

---

# Customer License Information

Purpose:

Show ownership details.

### License Card

| Field | Description |
|------|-------------|
| License ID | Unique ownership ID |
| Product | FinanceOS Bundle |
| Purchase Region | India / US / UK |
| Access | Lifetime Version 1 |
| Latest Eligible Version | V1.x |

License ID copy button included.

---

# Dashboard Search (Future)

Reserved for Version 2.

Search will support:

- Orders.
- Releases.
- Support Articles.

Not implemented in Version 1.

---

# Responsive Dashboard Rules

## Desktop

- Sticky sidebar.
- Two-column cards.
- Full-width tables.

## Tablet

- Drawer navigation.
- Two-column card grid.

## Mobile

- Bottom navigation.
- Single-column cards.
- Tables become expandable cards.

---

# Accessibility Rules

Dashboard supports:

- Keyboard navigation.
- Screen reader labels.
- Focus indicators.
- Accessible tables.
- Accessible download buttons.
- Reduced motion support.

Mandatory for Version 1.

---

# Performance Targets

| Metric | Target |
|--------|--------|
| Dashboard Initial Load | Under 1.5 seconds |
| Download Button Response | Under 200 ms |
| Version Check API | Under 500 ms |
| Orders Table Render | Under 300 ms |
| Notification Display | Instant |

---

# Analytics Events

Track customer dashboard usage.

| Event | Purpose |
|------|---------|
| Dashboard Viewed | Customer engagement |
| Excel Download Started | Download analytics |
| Google Sheets Copy Created | Platform analytics |
| Invoice Downloaded | Billing analytics |
| Update Downloaded | Version adoption |
| Support Page Viewed | Support analytics |

No spreadsheet usage analytics collected.

---

# Database Fields Referenced

Dashboard reads customer metadata.

## Customer Profile

| Field | Purpose |
|------|---------|
| Customer ID | Unique user identifier |
| Email | Login identity |
| Name | Dashboard greeting |
| Country | PPP region |
| Purchase Date | Product ownership |

## Purchase Metadata

| Field | Purpose |
|------|---------|
| Order ID | Purchase record |
| License ID | Ownership record |
| Current Eligible Version | Latest download |
| Downloads Enabled | Access control |
| Invoice Available | Billing |

---

# Component Mapping

Cursor builds reusable components.

| Component | Used In |
|-----------|---------|
| DashboardSidebar | All dashboard pages |
| WelcomeHeader | Dashboard overview |
| ProductCard | Product Library |
| DownloadCard | Download Center |
| UpdateBanner | Version Updates |
| VersionTimeline | Updates page |
| InvoiceCard | Orders page |
| SettingsCard | Account page |
| NotificationBanner | Global dashboard |
| EmptyState | No purchases |

---

# Cursor Implementation Rules

Cursor must:

- Build dashboard separately from public website.
- Use authenticated route protection.
- Create reusable dashboard layout.
- Keep sidebar persistent.
- Lazy-load downloads.
- Display latest eligible version automatically.
- Support unlimited downloads.
- Support invoice downloads.
- Reuse FinanceOS Design System components.

---

# Frozen Decisions (Version 1)

The following customer dashboard decisions are locked.

- Dedicated customer dashboard application.
- Sticky sidebar on desktop.
- Bottom navigation on mobile.
- Unlimited download center.
- Free Version 1 updates.
- Release timeline page.
- Invoice center.
- Account settings module.
- Email-based support center.
- Future ecosystem preview cards.

---

# Version History

## Version 1.0

Official FinanceOS customer dashboard specification defining dashboard architecture, navigation, download center, version update timeline, purchase history, invoice center, account settings, support center, notification system, responsive behavior, analytics events, accessibility, and Cursor implementation standards.

---

**End of Document**

**File:** `10_CUSTOMER_DASHBOARD.md`
