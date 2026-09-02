# 07_EMAIL_SYSTEM_ARCHITECTURE.md

## FinanceOS — Complete Email System Architecture & Transactional Messaging Specification (V1)

**Document ID:** BACKEND-07

**Version:** 1.0 (Official V1)

**Status:** Frozen Email Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete email architecture for FinanceOS using **Resend**.

It specifies:

- Transactional email architecture.
- Email template system.
- Customer lifecycle emails.
- Admin notification emails.
- Release notification emails.
- Purchase confirmation emails.
- Password reset emails.
- Email verification.
- Marketing email separation.
- Email analytics.
- Bounce and complaint handling.
- Email retry queue.
- Suppression list.
- Operations Center monitoring.
- Cursor implementation standards.

This document is the **single source of truth** for all email communication inside FinanceOS.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `02_AUTH_AND_SECURITY.md`
- `05_WEBHOOK_ARCHITECTURE.md`
- `06_PAYMENT_GATEWAY_ARCHITECTURE.md`

## Referenced Documents

- `06_EMAIL_AND_NOTIFICATION_CENTER.md`
- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`
- `07_ANALYTICS_AND_GROWTH_DASHBOARD.md`

## Referenced Integration Documents

- /docs/integrations/06_RESEND_EMAIL_API.md

---

# Email Technology Stack (Frozen)

| Layer | Technology |
|--------|------------|
| Email Provider | Resend |
| Template Engine | React Email + MJML-compatible HTML |
| Sending Method | Server-side API |
| Tracking | Resend Webhooks |
| Queue | Supabase Email Queue |
| Retry Jobs | Supabase Edge Functions |
| Analytics | Supabase + Operations Center |

---

# Email Philosophy

FinanceOS separates **transactional emails** from **marketing emails**.

| Transactional | Marketing |
|---------------|-----------|
| Purchase confirmation | Product announcements |
| Password reset | Launch campaigns |
| Email verification | Newsletter |
| Invoice delivery | Promotions |
| Download available | Referral campaigns |

Transactional emails are mandatory.

Marketing emails respect customer preferences.

---

# Email Architecture Overview

```text
Customer Action
       │
FinanceOS Backend
       │
Email Service
       │
Resend API
       │
Inbox
       │
Webhook Events
       │
Analytics Database
       │
Operations Center
```

All emails flow through the backend.

---

# Email Categories

FinanceOS supports **8 email categories**.

| Category | Purpose |
|----------|---------|
| Authentication | Login, verification, password reset |
| Orders | Purchase confirmation, invoice |
| Releases | New workbook version available |
| Customer Account | Profile/security alerts |
| Admin Alerts | Internal operations alerts |
| Marketing | Campaigns and launches |
| Support | Ticket updates |
| System | Downtime and maintenance notices |

Each category has independent templates.

---

# Email Template Inventory

## Authentication Templates

| Template ID | Trigger |
|-------------|---------|
| auth_verify_email | New account |
| auth_password_reset | Forgot password |
| auth_email_changed | Email updated |
| auth_login_alert | New device login |

---

## Order Templates

| Template ID | Trigger |
|-------------|---------|
| order_purchase_success | Payment completed |
| order_invoice_ready | Invoice generated |
| order_refund_completed | Refund processed |
| order_payment_failed | Payment failed |

---

## Release Templates

| Template ID | Trigger |
|-------------|---------|
| release_new_version | New workbook release |
| release_major_update | Major version published |
| release_patch_update | Bug fix release |

---

## Customer Account Templates

| Template ID | Trigger |
|-------------|---------|
| account_profile_updated | Profile edited |
| account_password_changed | Password changed |
| account_security_alert | Suspicious login |
| account_subscription_update | Future subscription support |

---

## Admin Templates

| Template ID | Trigger |
|-------------|---------|
| admin_webhook_failed | Webhook failure |
| admin_storage_warning | Storage threshold |
| admin_payment_alert | Payment issue |
| admin_daily_summary | Daily operations digest |

---

## Marketing Templates

| Template ID | Trigger |
|-------------|---------|
| marketing_launch | Product launch |
| marketing_newsletter | Newsletter |
| marketing_discount | Coupon campaign |
| marketing_referral | Referral campaign |

Marketing emails require opt-in.

---

# Email Template Folder Structure

```text
emails/

authentication/
orders/
releases/
marketing/
system/
admin/
components/
layouts/
```

Reusable components shared across templates.

---

# Email Layout System

Every email uses the same layout.

## Layout Sections

1. Header
2. Logo
3. Greeting
4. Main Content
5. CTA Button
6. Footer
7. Social Links
8. Legal Footer

Consistent branding across all emails.

---

# Branding Rules

Email branding follows Design System.

## Header

- FinanceOS Logo
- White background
- Accent color divider

## Footer

- Website
- Support email
- Social links
- Copyright
- Unsubscribe (marketing only)

---

# Purchase Confirmation Email

Trigger:

Successful payment webhook.

## Contents

- Customer name.
- Product purchased.
- Version purchased.
- Amount paid.
- Currency.
- Invoice button.
- Dashboard button.
- Download button.

Sent immediately after payment.

---

# Invoice Email

Sent after invoice generation.

Contains:

- Invoice PDF attachment.
- Invoice number.
- Order summary.
- Billing details.
- Payment gateway.

Customer may re-download invoice later.

---

# Release Notification Email

Trigger:

Admin publishes release.

Recipients:

Customers owning product license.

## Includes

- Version number.
- What's New.
- Bug fixes.
- New features.
- Download button.
- Changelog button.

Automatically personalized.

---

# Password Reset Email

Trigger:

Forgot password.

Rules:

- Single-use link.
- 30-minute expiration.
- HTTPS only.
- No password included.

---

# Email Verification Template

Trigger:

Account creation.

Contains:

- Welcome message.
- Verify Email button.
- Expiration notice.
- Support link.

Required before downloads.

---

# Security Alert Email

Trigger:

- New device login.
- Password changed.
- Email changed.
- Session revoked.

Contains device information and location.

---

# Welcome Email

Trigger:

Email verified successfully.

Contains:

- Welcome to FinanceOS.
- Dashboard button.
- Workbook overview.
- Support resources.

Sent once.

---

# Payment Failed Email

Trigger:

Failed checkout.

Contains:

- Payment failed notice.
- Retry payment button.
- Support contact.

No invoice generated.

---

# Refund Confirmation Email

Trigger:

Refund webhook.

Contains:

- Refund amount.
- Currency.
- Processing timeline.
- Support contact.

---

# Marketing Email Rules

Marketing emails:

- Never include invoices.
- Never include download links.
- Must include unsubscribe.
- Respect notification preferences.

Separate sending pipeline.

---

# Email Queue Architecture

Emails enter queue before sending.

```text
Event
   │
Email Queue
   │
Edge Function Worker
   │
Resend API
   │
Webhook Status Update
```

Queue decouples email sending from user request.

---

# Email Queue Table

Stores:

- recipient.
- template.
- payload.
- priority.
- status.
- retry count.
- scheduled time.

Supports retries.

---

# Email Priorities

| Priority | Examples |
|----------|----------|
| Critical | Password reset |
| High | Purchase confirmation |
| Medium | Release notification |
| Low | Marketing campaign |

Critical emails processed first.

---

# Retry Policy

Retry only transient failures.

| Attempt | Delay |
|---------|-------|
| First | 1 Minute |
| Second | 5 Minutes |
| Third | 15 Minutes |
| Fourth | 1 Hour |
| Fifth | 6 Hours |

After fifth failure → dead-letter queue.

---

# Bounce Handling

Webhook updates email status.

Bounce actions:

- Mark email bounced.
- Increase bounce count.
- Add suppression candidate.
- Notify Operations Center if needed.

---

# Complaint Handling

Complaint actions:

- Add suppression list.
- Disable marketing emails.
- Notify admin.
- Preserve transactional email capability if appropriate.

---

# Suppression List

Purpose:

Prevent repeated delivery failures.

Reasons include:

- Hard bounce.
- Spam complaint.
- Manual suppression.
- Invalid email.

Stored in database.

---

# Email Analytics

Tracked metrics:

| Metric |
|--------|
| Sent |
| Delivered |
| Opened |
| Clicked |
| Bounced |
| Complained |
| Failed |
| Retry Count |

Displayed in Analytics Dashboard.

---

# Open Tracking

Resend webhook records:

- opened timestamp.
- device.
- email client (when available).

Used only for analytics.

---

# Click Tracking

Tracked CTA buttons:

- Download Workbook.
- View Dashboard.
- View Invoice.
- Read Changelog.
- Reset Password.
- Verify Email.

Stored as email events.

---

# Email Preferences

Customers manage preferences.

Categories:

- Product Updates.
- Marketing.
- Newsletter.
- Security Alerts.
- Billing Emails.
- Release Notifications.

Security emails cannot be disabled.

---

# Scheduled Email Support

Supports scheduled campaigns.

Examples:

- Launch day.
- Future release.
- Black Friday.
- Referral campaign.

Stored in email queue.

---

# Operations Center Email Monitoring

Widgets include:

- Emails Sent Today.
- Delivery Rate.
- Bounce Rate.
- Complaint Rate.
- Retry Queue.
- Failed Emails.

Live dashboard.

---

# Daily Email Digest

Admin receives daily summary containing:

- Revenue email stats.
- Failed emails.
- Bounce summary.
- Campaign performance.
- Queue health.

Optional admin setting.

---

# Email Security Rules

Requirements:

- Server-side sending only.
- API key never client-side.
- Template sanitization.
- No arbitrary HTML injection.
- Signed webhook verification.

---

# Email Localization (V2 Ready)

Architecture supports:

- English.
- Arabic.
- Hindi.
- Malayalam.
- Other locales.

V1 ships English only.

---

# Email Attachments

Supported attachments:

| Attachment | Usage |
|-----------|-------|
| PDF Invoice | Purchase |
| CSV Export | Admin |
| Workbook Preview PDF | Future |
| Support Attachments | Future |

Workbook XLSX never sent via email.

---

# Cursor Implementation Rules

Cursor must:

- Use Resend SDK server-side.
- Store templates separately.
- Queue emails before sending.
- Track delivery via webhook.
- Update analytics tables.
- Implement suppression list.
- Respect email preferences.
- Retry transient failures.
- Log every email event.

---

# Frozen V1 Decisions

- Resend as email provider.
- Transactional and marketing separation.
- Shared branded email layout.
- Queue-based sending.
- Five retry attempts.
- Bounce and complaint handling.
- Suppression list.
- Email analytics.
- English templates only.
- Workbook downloads only through dashboard.

All email architecture decisions are frozen for V1.

---

# Next Document

**08_OPERATIONS_CENTER_BACKEND.md**

The next backend specification defines:

- Backend architecture for Operations Center.
- Analytics aggregation pipeline.
- Meta API synchronization.
- Stripe/Razorpay synchronization.
- Google Analytics synchronization.
- Search Console synchronization.
- Resend synchronization.
- Sentry synchronization.
- Health monitoring APIs.
- Cache refresh jobs.
- KPI calculation engine.
- Alert engine.
- Live Operations dashboard backend.
