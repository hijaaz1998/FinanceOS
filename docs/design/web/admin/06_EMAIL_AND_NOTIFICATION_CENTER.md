# 06_EMAIL_AND_NOTIFICATION_CENTER.md

## FinanceOS — Email, Notification & Communication Center Specification

**Document ID:** WEB-ADMIN-06

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Email & Notification Center)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `02_CUSTOMER_MANAGEMENT.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `05_PAYMENT_AND_COUPON_SYSTEM.md`
- `docs/web/user/08_AUTH_AND_USER_ACCOUNTS.md`
- `docs/web/user/09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `docs/web/user/10_CUSTOMER_DASHBOARD.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`

---

# Purpose

This document defines the complete **Email and Notification Center** inside the FinanceOS Admin Portal.

The system manages every communication sent from FinanceOS to customers, including:

- Authentication emails.
- Purchase confirmations.
- Download emails.
- Version update emails.
- Password reset emails.
- Newsletter broadcasts.
- In-app dashboard notifications.
- Email delivery logs.
- Notification preferences.

This document is the **single source of truth** for Cursor when implementing customer communications.

---

# Communication Philosophy

FinanceOS communication follows four principles.

1. **Transactional emails** are automatic and event-driven.
2. **Marketing emails** are opt-in broadcasts.
3. **In-app notifications** keep customers informed inside the dashboard.
4. Every communication is logged for auditing.

The Email Center is an operational communication hub, not a CRM.

---

# Communication Architecture

```text
System Event
     │
     ▼
Trigger Engine
     │
     ├── Transactional Email
     ├── Dashboard Notification
     ├── Marketing Email (Optional)
     └── Future Push Notification
     │
     ▼
Delivery Logs
     │
     ▼
Customer Inbox / Dashboard
```

This architecture is frozen.

---

# Email Center Overview

| Section | Purpose |
|---------|---------|
| Email Dashboard | Delivery overview and KPIs. |
| Transactional Templates | System-generated emails. |
| Broadcast Center | Marketing and announcement emails. |
| Notification Center | Dashboard notifications. |
| Delivery Logs | Email history. |
| Customer Preferences | Email subscription management. |
| Version Update Campaigns | Release communication. |

---

# Email Dashboard

Top dashboard displays communication KPIs.

## KPI Cards

| KPI | Description |
|-----|-------------|
| Emails Sent Today | Total emails sent today. |
| Delivery Rate | Successfully delivered emails. |
| Open Rate | Open percentage. |
| Click Rate | CTA click percentage. |
| Failed Emails | Delivery failures. |
| Active Subscribers | Marketing subscribers. |

---

# Email Categories

FinanceOS has **three communication categories**.

| Category | Purpose |
|----------|---------|
| Transactional | Account and purchase events. |
| Product Updates | Version releases and announcements. |
| Marketing | Educational and promotional campaigns. |

Each category has separate templates.

---

# Transactional Email Library

Version 1 includes **10 transactional templates**.

| Template | Trigger |
|----------|---------|
| Welcome Email | Account created. |
| Verify Email | Signup. |
| Password Reset | Password reset requested. |
| Purchase Confirmation | Successful payment. |
| Download Available | Purchase completed. |
| Invoice Available | Invoice generated. |
| Version Update | New release published. |
| Download Restored | Admin restored downloads. |
| Refund Confirmation | Refund completed. |
| Email Changed | Customer changes email. |

Templates are immutable system templates.

---

# Email Template Table

| Column | Description |
|--------|-------------|
| Template Name | Display name. |
| Category | Transactional / Marketing. |
| Status | Active / Draft. |
| Last Updated | Timestamp. |
| Trigger | Linked event. |
| Actions | Preview / Edit. |

---

# Email Template Structure

Every template contains:

1. Subject.
2. Preview text.
3. Header.
4. Body.
5. CTA button.
6. Footer.

Shared design across every email.

---

# Email Design System

Emails follow FinanceOS branding.

## Header

Contains:

- FinanceOS logo.
- Product name.
- Brand color strip.

---

## Body

Structure:

```text
Greeting

Main Message

Information Card

Primary CTA

Secondary Help Section
```

Maximum content width: **640px**.

---

## Footer

Contains:

- Support email.
- Website link.
- Privacy Policy.
- Unsubscribe (marketing only).
- Copyright.

Shared footer component.

---

# Welcome Email

Trigger:

Customer verifies account.

## Contents

- Welcome message.
- FinanceOS overview.
- Dashboard button.
- Download instructions.
- Support links.

CTA:

**Go to Dashboard**

---

# Email Verification Template

Trigger:

Signup.

CTA:

**Verify Email Address**

Expiration handled by authentication system.

---

# Password Reset Email

Trigger:

Forgot password request.

CTA:

**Reset Password**

Security notice included.

---

# Purchase Confirmation Email

Trigger:

Successful payment verification.

Contains:

| Section | Description |
|---------|-------------|
| Order Summary | Product purchased. |
| Invoice Summary | Invoice number. |
| Download Button | Dashboard shortcut. |
| License Information | Version ownership. |

Primary CTA:

**Download FinanceOS**

---

# Download Available Email

Trigger:

Purchase completed.

Contains:

- Excel download.
- Google Sheets copy.
- Dashboard shortcut.
- Installation guide.

---

# Invoice Email

Trigger:

Invoice generated.

Contains:

- Invoice summary.
- Amount paid.
- Currency.
- Download invoice button.

---

# Version Update Email

Trigger:

New workbook release published.

Contains:

- Version number.
- What's New summary.
- Improvements.
- Bug fixes.
- Download latest version button.

---

# Refund Confirmation Email

Trigger:

Refund completed.

Contains:

- Refund amount.
- Currency.
- Order ID.
- Refund completion notice.

---

# Broadcast Center

Purpose:

Send announcements to customer groups.

---

# Broadcast Dashboard

KPIs:

| KPI | Description |
|-----|-------------|
| Active Campaigns | Running broadcasts. |
| Scheduled Broadcasts | Future emails. |
| Delivered Broadcasts | Completed campaigns. |
| Open Rate | Campaign engagement. |
| Click Rate | CTA engagement. |

---

# Broadcast Creation Workflow

```text
Create Broadcast
      │
Choose Audience
      │
Write Email
      │
Preview
      │
Schedule or Send
      │
Delivery Logs
```

---

# Broadcast Form

Required fields.

| Field | Required |
|-------|----------|
| Campaign Name | Yes |
| Subject | Yes |
| Preview Text | Yes |
| Audience | Yes |
| CTA Label | Optional |
| CTA URL | Optional |
| Send Date | Yes |

---

# Audience Segments

Version 1 supports predefined audiences.

| Audience | Description |
|----------|-------------|
| All Customers | Every verified customer. |
| Paying Customers | Customers with purchases. |
| Latest Version Users | Customers on latest version. |
| Update Eligible Customers | Can download latest release. |
| Marketing Subscribers | Opt-in subscribers. |

---

# Broadcast Status System

| Status | Meaning |
|--------|---------|
| Draft | Not scheduled. |
| Scheduled | Future send. |
| Sending | Currently sending. |
| Sent | Completed delivery. |
| Cancelled | Broadcast cancelled. |

---

# Email Preview Mode

Preview displays:

- Desktop email.
- Mobile email.
- Dark mode preview (future reserved).

No email can be sent without preview.

---

# Version Update Campaign Center

Purpose:

Notify customers about workbook releases.

---

# Version Campaign Workflow

```text
Release Published
      │
Create Version Campaign
      │
Eligible Customers Selected
      │
Emails Sent
      │
Dashboard Notifications Created
```

Automatic workflow after release.

---

# Version Campaign Metrics

| Metric | Description |
|--------|-------------|
| Emails Sent | Count |
| Opens | Count |
| Download Clicks | Count |
| Downloads Completed | Count |
| Adoption Rate | Percentage |

---

# Dashboard Notification Center

Purpose:

In-app notifications inside Customer Dashboard.

---

# Notification Types

| Type | Example |
|------|---------|
| Product Update | Version available. |
| Download Ready | Workbook available. |
| Purchase Success | Order completed. |
| Refund Update | Refund processed. |
| Security | Password changed. |
| System | Maintenance notice. |

---

# Notification Table

| Column | Description |
|--------|-------------|
| Notification ID | Unique identifier |
| Type | Update / Purchase / Security |
| Title | Notification title |
| Audience | Customer group |
| Created Date | Timestamp |
| Status | Active / Archived |

---

# Notification Card Design

Contains:

- Icon.
- Title.
- Description.
- Timestamp.
- CTA button.

Displayed in customer dashboard.

---

# Notification Lifecycle

```text
Created
   │
Published
   │
Delivered
   │
Read
   │
Archived
```

Unread/read status tracked.

---

# Customer Notification Preferences

Customers manage preferences.

## Settings

| Preference | Default |
|-----------|---------|
| Product Updates | Enabled |
| Purchase Emails | Enabled |
| Download Emails | Enabled |
| Marketing Emails | Enabled |
| Security Emails | Always Enabled |

Security emails cannot be disabled.

---

# Delivery Logs Center

Purpose:

Track every email sent.

---

# Delivery Log Table

| Column | Description |
|--------|-------------|
| Email ID | Unique email identifier |
| Customer | Recipient |
| Template | Email template |
| Status | Delivered / Failed |
| Sent Date | Timestamp |
| Opened | Yes / No |

---

# Delivery Status System

| Status | Meaning |
|--------|---------|
| Queued | Waiting to send. |
| Sent | Successfully sent. |
| Delivered | Delivered to inbox. |
| Opened | Customer opened email. |
| Failed | Delivery failed. |
| Bounced | Email bounced. |

---

# Failed Email Center

Purpose:

Monitor delivery failures.

---

# Failed Email Table

| Column | Description |
|--------|-------------|
| Email ID | Failed email |
| Customer | Recipient |
| Template | Template used |
| Failure Reason | Delivery failure |
| Retry Status | Pending / Completed |

---

# Retry Email Workflow

```text
Failed Email
     │
Retry Button
     │
Queued Again
     │
Delivered
```

Retry action logged.

---

# Email Activity Timeline

Timeline includes:

- Email queued.
- Email sent.
- Delivered.
- Opened.
- CTA clicked.
- Retry sent.

Immutable history.

---

# Broadcast Analytics

Charts include:

- Sends over time.
- Open rate.
- Click rate.
- Bounce rate.
- Unsubscribe rate.

---

# Marketing Subscriber Management

Subscriber table.

| Column | Description |
|--------|-------------|
| Customer | Name |
| Email | Subscriber email |
| Status | Subscribed / Unsubscribed |
| Joined Date | Subscription date |
| Last Campaign Opened | Timestamp |

---

# Unsubscribe Rules

Marketing emails include unsubscribe link.

Transactional emails ignore unsubscribe preferences.

---

# Email Variables System

Templates support dynamic variables.

| Variable | Example |
|----------|---------|
| Customer Name | John |
| Order ID | ORD-2026-00125 |
| Version | V1.2.0 |
| Download Link | Customer dashboard |
| Invoice Number | INV-2026-00125 |

Variables inserted automatically.

---

# Scheduled Email Queue

Purpose:

Future email scheduling.

Supports:

- Date.
- Time.
- Timezone (UTC backend).

---

# Email Queue Dashboard

Displays:

- Scheduled emails.
- Sending emails.
- Completed emails.
- Failed emails.

---

# Bulk Email Actions

| Action | Applies To |
|--------|------------|
| Send Broadcast | Draft campaign |
| Cancel Scheduled Campaign | Scheduled campaign |
| Retry Failed Emails | Failed deliveries |
| Archive Campaign | Completed campaigns |
| Export Delivery Logs | Date range |

---

# Export Delivery Logs

Supported exports.

| Format | Version 1 |
|--------|-----------|
| CSV | Yes |
| Excel | Yes |
| PDF | Future |

---

# Empty States

Examples.

## No Campaigns

"No broadcast campaigns created."

## No Notifications

"No active dashboard notifications."

## No Failed Emails

"No failed email deliveries."

---

# Loading States

Skeleton loaders for:

- Email table.
- Broadcast dashboard.
- Delivery logs.
- Notification center.

---

# Responsive Behavior

## Desktop

Full campaign dashboard.

## Tablet

Reduced table columns.

## Mobile

Campaign cards replace tables.

Email preview becomes stacked.

---

# Accessibility Rules

Supports:

- Keyboard navigation.
- Accessible forms.
- Accessible email preview.
- Accessible tables.
- Focus management.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Email Dashboard Load | Under 800ms |
| Broadcast Scheduling | Under 500ms |
| Delivery Log Search | Under 300ms |
| Retry Failed Email | Under 500ms |

---

# Database Fields Referenced

## Email Templates

| Field | Purpose |
|------|---------|
| Template ID | Primary identifier |
| Subject | Email subject |
| Category | Transactional / Marketing |
| Trigger | Event trigger |
| Updated At | Version tracking |

## Email Logs

| Field | Purpose |
|------|---------|
| Email ID | Delivery identifier |
| Customer ID | Recipient |
| Status | Delivery lifecycle |
| Sent At | Timestamp |
| Opened At | Engagement tracking |

## Notifications

| Field | Purpose |
|------|---------|
| Notification ID | Dashboard notification |
| Audience | Target group |
| Type | Notification category |
| Published At | Timestamp |

---

# Cursor Components

| Component | Used In |
|-----------|---------|
| EmailTemplateTable | Templates |
| BroadcastTable | Campaigns |
| EmailPreviewCard | Preview mode |
| NotificationTable | Dashboard notifications |
| DeliveryLogTable | Delivery history |
| SubscriberTable | Marketing subscribers |
| RetryEmailModal | Failed emails |
| CampaignAnalyticsChart | Broadcast analytics |

---

# Cursor Implementation Rules

Cursor must:

1. Separate transactional and marketing emails.
2. Build reusable email template system.
3. Build broadcast scheduler.
4. Automatically trigger version update campaigns.
5. Build dashboard notification center.
6. Build delivery log history.
7. Support retrying failed emails.
8. Respect customer notification preferences.

---

# Frozen Decisions (Version 1)

The following Email & Notification decisions are locked.

- Transactional emails are automatic.
- Marketing emails require subscription.
- Security emails cannot be disabled.
- Dashboard notifications mirror important emails.
- Email templates use shared FinanceOS branding.
- Version releases automatically generate update campaigns.
- Delivery logs retained permanently.
- CSV/Excel export supported.

---

# Version History

## Version 1.0

Official FinanceOS Email & Notification Center specification defining transactional email templates, marketing broadcasts, dashboard notifications, delivery logs, subscriber management, version update campaigns, communication preferences, analytics, and Cursor implementation standards.

---

**End of Document**

**File:** `06_EMAIL_AND_NOTIFICATION_CENTER.md`
