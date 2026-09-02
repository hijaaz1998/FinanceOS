# 11_OPERATIONS_CENTER_AND_INTEGRATIONS.md

## FinanceOS — Operations Center, Integrations & Live Business Monitoring Specification

**Document ID:** WEB-ADMIN-11

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Operations Center & Integrations)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

This document references existing Admin modules and **extends them** with live operational monitoring.

### Required Admin Documents

- `00_ADMIN_MASTER.md`
- `01_ADMIN_LAYOUT_AND_NAVIGATION.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `05_PAYMENT_AND_COUPON_SYSTEM.md`
- `06_EMAIL_AND_NOTIFICATION_CENTER.md`
- `07_ANALYTICS_AND_GROWTH_DASHBOARD.md`
- `08_CONTENT_AND_MEDIA_LIBRARY.md`
- `09_ADMIN_SECURITY_AND_ROLES.md`
- `10_ADMIN_IMPLEMENTATION_CHECKLIST.md`

### Required Backend Specifications

- `backend/01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `backend/02_AUTH_AND_SECURITY.md`
- `backend/03_STORAGE_ARCHITECTURE.md`
- `backend/05_WEBHOOK_ARCHITECTURE.md`

### Required Design Specifications

- `design/00_DESIGN_MASTER.md`
- `design/01_DESIGN_SYSTEM.md`
- `design/04_CHART_UI_GUIDELINES.md`
- `design/06_DASHBOARD_CARD_SYSTEM.md`

---

# Purpose

The **Operations Center** is the real-time command center of the FinanceOS business.

Unlike the Analytics Dashboard, which focuses on business metrics and reports, the Operations Center focuses on **live operational health**.

It provides one place where administrators can monitor:

- Payments
- Revenue
- Advertising campaigns
- Website traffic
- SEO health
- Email delivery
- Backend services
- Storage usage
- Deployments
- Error monitoring
- Webhook events
- Integration health

The goal is to eliminate switching between Stripe, Razorpay, Meta Ads Manager, Google Analytics, Resend, Supabase, Vercel, and Sentry.

Everything important is visible inside FinanceOS.

This document is the **single source of truth** for Cursor when implementing the Operations Center.

---

# Operations Center Philosophy

FinanceOS Admin should become the business operating system.

Instead of opening multiple dashboards every morning, administrators open one page.

The Operations Center answers these questions immediately:

- Are payments working?
- Are customers buying today?
- Are Meta campaigns profitable?
- Is Google Analytics receiving traffic?
- Are emails delivering?
- Is Supabase healthy?
- Was today's deployment successful?
- Are any webhooks failing?
- Are customers affected by any production issue?

If something breaks, the Operations Center surfaces it within seconds.

---

# Operations Center Location

The Operations Center is **inside Analytics**.

Navigation structure:

```text
Analytics
│
├── Executive Dashboard
├── Revenue Analytics
├── Customer Analytics
├── Marketing Analytics
├── Product Analytics
├── Email Analytics
├── Operations Center ⭐
└── Reports
```

No additional top-level sidebar item is created.

This decision is frozen.

---

# Operations Center Dashboard Architecture

```text
Operations Center
│
├── Global Service Health
├── Revenue & Payments
├── Marketing Operations
├── Website Operations
├── SEO Operations
├── Email Operations
├── Backend Operations
├── Deployment Operations
├── Error Monitoring
├── Webhook Monitoring
└── Global Alerts
```

Every section refreshes independently.

---

# Dashboard Layout Structure

Operations Center uses a fixed vertical layout.

```text
Global Health Strip

Executive KPI Cards

Revenue & Payments

Marketing Operations

Website Operations

SEO Operations

Email Operations

Backend Operations

Deployment Operations

Error Monitoring

Webhook Monitoring

Global Alert Feed
```

Sections are collapsible.

---

# Refresh Strategy

Every widget has its own refresh policy.

| Widget | Refresh Interval |
|---------|------------------|
| Service Status | Realtime |
| Revenue KPIs | Every 30 seconds |
| Payments | Every 30 seconds |
| Meta Campaigns | Every 5 minutes |
| GA4 Traffic | Every minute |
| Search Console | Every hour |
| Emails | Every minute |
| Supabase Health | Every minute |
| Deployments | Every minute |
| Sentry Errors | Every minute |
| Webhooks | Realtime |

Widgets refresh independently to reduce API load.

---

# Global Service Health Strip

The top row is permanently visible.

Purpose:

Instantly show the health of every connected service.

---

## Health Strip Services

| Service | Indicator |
|----------|-----------|
| Stripe | Healthy / Warning / Offline |
| Razorpay | Healthy / Warning / Offline |
| Meta API | Healthy / Warning / Offline |
| Google Analytics | Healthy / Warning / Offline |
| Search Console | Healthy / Warning / Offline |
| Resend | Healthy / Warning / Offline |
| Supabase | Healthy / Warning / Offline |
| Vercel | Healthy / Warning / Offline |
| Sentry | Healthy / Warning / Offline |

---

## Service Status Colors

| Status | Color |
|--------|-------|
| Healthy | Green |
| Warning | Yellow |
| Error | Red |
| Syncing | Blue |
| Disabled | Gray |

Shared status badge component.

---

## Health Strip Card

Every service card displays:

| Element | Description |
|---------|-------------|
| Logo | Integration icon |
| Service Name | Stripe, Meta, etc. |
| Current Status | Healthy / Warning |
| Last Sync | Timestamp |
| Response Time | API latency |

Example:

Stripe

Healthy

Last Sync: 11:32:14 AM

Latency: 142ms

---

# Executive Operations KPIs

Below the health strip.

Purpose:

High-level operational metrics.

## KPI Cards

| KPI | Source |
|-----|--------|
| Revenue Today | Stripe + Razorpay |
| Successful Payments | Payment gateways |
| Active Visitors | GA4 |
| Emails Delivered Today | Resend |
| Failed Webhooks | Webhook Center |
| Critical Errors | Sentry |
| Production Deployment | Vercel |
| Active Customers Online | Supabase Realtime |

These KPIs always reflect live operational data.

---

# Date Range Behavior

Operations KPIs support:

- Today
- Last 24 Hours
- Last 7 Days
- Last 30 Days

Realtime widgets ignore historical filters.

---

# Global Alert Feed

Purpose:

Show production issues immediately.

---

## Alert Severity Levels

| Severity | Description |
|----------|-------------|
| Critical | Immediate action required |
| High | Production issue |
| Medium | Warning |
| Low | Informational |

---

## Alert Categories

| Category | Example |
|----------|---------|
| Payments | Stripe webhook failed |
| Marketing | Meta API disconnected |
| Website | Traffic anomaly |
| Emails | Bounce spike |
| Backend | Database latency |
| Deployments | Failed deployment |
| Errors | Frontend exception spike |

---

## Alert Card Layout

Contains:

- Severity color.
- Icon.
- Title.
- Description.
- Timestamp.
- View Details button.

Alerts remain visible until acknowledged.

---

# Alert Acknowledgement Workflow

```text
Alert Created
      │
Displayed in Feed
      │
Admin Opens Alert
      │
Acknowledged
      │
Alert Archived
```

Acknowledgement is logged in Audit Logs.

---

# Operations Dashboard Filters

Shared filters.

| Filter | Purpose |
|--------|---------|
| Time Range | Historical metrics |
| Country | Regional metrics |
| Currency | Revenue widgets |
| Gateway | Stripe / Razorpay |
| Campaign | Meta campaigns |
| Service | Health widgets |

Filters synchronize relevant widgets only.

---

# Operations Search

Search integrations by:

- Service name.
- Webhook event.
- Campaign.
- Payment ID.
- Deployment ID.
- Error ID.

Global operational search available.

---

# Realtime Indicator Rules

Widgets show live indicators.

| Indicator | Meaning |
|----------|---------|
| LIVE | Realtime subscription |
| REFRESHING | Polling in progress |
| DELAYED | Waiting for sync |
| ERROR | Refresh failed |

---

# Connection Status Drawer

Clicking a service opens a connection drawer.

Displays:

- Service icon.
- Connection status.
- API latency.
- Last successful sync.
- Authentication status.
- Environment.
- Connected account.

Reusable for every integration.

---

# Sync History

Every integration stores sync history.

| Field | Description |
|------|-------------|
| Sync Time | Timestamp |
| Service | Stripe / Meta |
| Result | Success / Failed |
| Duration | API response time |

Maximum history retained: 90 days.

---

# API Rate Limit Monitoring

Every connected API shows remaining quota when available.

| Service | Metric |
|----------|--------|
| Meta API | Remaining quota |
| GA4 | Requests used |
| Search Console | Daily quota |
| Stripe | Rate limit status |
| Resend | API usage |

Warning displayed before limits are exceeded.

---

# Dashboard Persistence Rules

User preferences saved.

Saved settings include:

- Widget collapse state.
- Widget order.
- Time range.
- Theme.
- Last viewed section.

Stored per admin account.

---

# Accessibility Rules

Operations Center supports:

- Keyboard navigation.
- Live region announcements.
- Accessible status badges.
- Accessible charts.
- Reduced motion support.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Operations Center Initial Load | Under 1.5 seconds |
| KPI Refresh | Under 500ms |
| Service Status Refresh | Under 300ms |
| Alert Feed Update | Realtime |

---

# Cursor Components Introduced

| Component | Purpose |
|-----------|---------|
| ServiceHealthStrip | Top integration health row |
| OperationsKPIGrid | Executive KPIs |
| AlertFeed | Global alerts |
| ConnectionStatusDrawer | Integration details |
| SyncHistoryTable | API sync history |
| ServiceStatusBadge | Health indicators |
| OperationsFilterBar | Shared filters |

---

# Frozen Decisions (Section 1)

The following Operations Center decisions are locked.

- Operations Center lives inside Analytics.
- No new top-level sidebar item.
- Global health strip always visible.
- Realtime alert feed.
- Independent widget refresh intervals.
- Shared operational search.
- Shared connection status drawer.
- Sync history retained for 90 days.

---

# Next Sections (Continued in the same file)

The remainder of **11_OPERATIONS_CENTER_AND_INTEGRATIONS.md** continues with these major chapters:

1. **Stripe Operations Dashboard** (~25 pages)
2. **Razorpay Operations Dashboard** (~20 pages)
3. **Meta Ads Operations Dashboard** (~25 pages)
4. **Google Analytics + Search Console Dashboard** (~25 pages)
5. **Resend Email Operations Dashboard** (~18 pages)
6. **Supabase Operations Dashboard** (~20 pages)
7. **Vercel Deployment Monitor** (~15 pages)
8. **Sentry Error Monitoring Dashboard** (~18 pages)
9. **Webhook Monitoring Center** (~25 pages)
10. **Integration Health, Sync Architecture & Cursor Implementation Rules** (~20 pages)

This is **Part 1** of the official `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md` file.
