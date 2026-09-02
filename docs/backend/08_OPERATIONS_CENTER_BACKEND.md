# 08_OPERATIONS_CENTER_BACKEND.md

## FinanceOS — Operations Center Backend, Integrations & Monitoring Architecture (V1)

**Document ID:** BACKEND-08

**Version:** 1.0 (Official V1)

**Status:** Frozen Operations Center Backend Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete backend architecture for the **FinanceOS Operations Center**.

It specifies:

- Live Operations Center backend.
- Integration aggregation layer.
- Meta Marketing synchronization.
- Stripe & Razorpay synchronization.
- Google Analytics synchronization.
- Search Console synchronization.
- Resend synchronization.
- Sentry synchronization.
- Supabase health monitoring.
- Vercel deployment monitoring.
- KPI calculation engine.
- Alert engine.
- Background synchronization jobs.
- Cache architecture.
- Operations APIs.
- Cursor implementation rules.

This document powers the **single Operations Center dashboard** that replaces switching between multiple third-party dashboards.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `04_API_ARCHITECTURE.md`
- `05_WEBHOOK_ARCHITECTURE.md`
- `07_EMAIL_SYSTEM_ARCHITECTURE.md`

## Referenced Documents

- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`
- `07_ANALYTICS_AND_GROWTH_DASHBOARD.md`
- `09_ADMIN_SECURITY_AND_ROLES.md`

## Referenced Integration Documents

- /docs/integrations/01_STRIPE_INTEGRATION.md
- /docs/integrations/02_RAZORPAY_INTEGRATION.md
- /docs/integrations/03_META_MARKETING_API.md
- /docs/integrations/04_GOOGLE_ANALYTICS_4.md
- /docs/integrations/05_GOOGLE_SEARCH_CONSOLE.md
- /docs/integrations/06_RESEND_EMAIL_API.md
- /docs/integrations/07_SENTRY_MONITORING.md
- /docs/integrations/08_VERCEL_DEPLOYMENT_API.md
- /docs/integrations/09_SUPABASE_SERVICES.md
- /docs/integrations/10_OPERATIONS_SYNC_ENGINE.md

---

# Operations Center Philosophy

The Operations Center is **FinanceOS Mission Control**.

Instead of opening:

- Stripe Dashboard
- Razorpay Dashboard
- Meta Ads Manager
- Google Analytics
- Search Console
- Resend Dashboard
- Sentry Dashboard
- Vercel Dashboard

FinanceOS synchronizes data into one unified dashboard.

Third-party APIs are **read-only** unless explicitly performing actions (refunds, resend email, etc.).

---

# Operations Center Architecture Overview

```text
Third-Party APIs
│
├── Stripe API
├── Razorpay API
├── Meta Marketing API
├── Google Analytics API
├── Search Console API
├── Resend API
├── Sentry API
└── Vercel API
        │
Background Sync Layer
        │
Supabase Cache Tables
        │
Operations Service
        │
Operations API
        │
Admin Operations Dashboard
```

This architecture is frozen.

---

# Operations Center Modules

| Module | Purpose |
|--------|---------|
| Executive KPIs | Revenue & business overview |
| Payments | Stripe & Razorpay monitoring |
| Marketing | Meta + GA4 + Search Console |
| Email | Resend delivery metrics |
| Infrastructure | Supabase, Vercel, Storage |
| Errors | Sentry issues |
| Deployments | Vercel deployment history |
| Webhooks | Incoming webhook health |
| Alerts | Critical system alerts |
| Background Jobs | Cron & sync monitoring |

---

# Operations Dashboard API

Primary endpoint:

```text
GET /api/operations/dashboard
```

Returns a single optimized payload containing:

- KPIs.
- Revenue.
- Visitors.
- Marketing spend.
- Failed payments.
- Email delivery.
- Storage usage.
- Alerts.

No client-side aggregation.

---

# Executive KPI Engine

Top KPI cards displayed in Operations Center.

## KPIs

| KPI | Source |
|-----|--------|
| Revenue Today | Payments Cache |
| Revenue This Month | Analytics Revenue |
| Orders Today | Orders Table |
| Active Customers | Profiles Table |
| Downloads Today | Downloads Table |
| Email Delivery Rate | Resend Cache |
| Marketing ROAS | Meta Cache |
| Website Sessions | GA4 Cache |
| Failed Payments | Payments Cache |
| Critical Alerts | Operations Alerts |

Refreshed every 30 seconds.

---

# Stripe Synchronization

Purpose:

Fetch financial metrics.

## Synced Metrics

| Metric |
|--------|
| Revenue |
| Successful Payments |
| Failed Payments |
| Refunds |
| Average Order Value |
| Currency Split |
| Payment Intent Status |
| Webhook Health |

Stored inside `operations_payments_cache`.

---

# Razorpay Synchronization

Additional India-specific metrics.

## Synced Data

- UPI payments.
- Card payments.
- Refunds.
- Settlements.
- Settlement delays.
- Payment failures.
- Gateway latency.

Merged into Operations Center.

---

# Payment Synchronization Strategy

Background job schedule:

| Frequency | Task |
|----------|------|
| Every 30 Seconds | Payment KPIs |
| Every Minute | Failed Payments |
| Every 5 Minutes | Refund Summary |
| Hourly | Settlement Summary |

No live API polling from browser.

---

# Meta Marketing Synchronization

Purpose:

Fetch advertising metrics.

## Synced Metrics

| Metric |
|--------|
| Spend |
| Impressions |
| Reach |
| Clicks |
| CTR |
| CPC |
| CPM |
| Purchases |
| ROAS |
| Campaign Status |

Stored in marketing cache table.

---

# Campaign Cache Strategy

Database stores latest campaign snapshot.

Fields include:

- campaign ID.
- campaign name.
- spend today.
- spend yesterday.
- purchases.
- ROAS.
- status.

Operations dashboard queries cache only.

---

# Google Analytics Synchronization

Purpose:

Website performance metrics.

## Synced Metrics

| Metric |
|--------|
| Sessions |
| Active Users |
| New Users |
| Returning Users |
| Bounce Rate |
| Engagement Time |
| Traffic Source |
| Device Breakdown |
| Country Breakdown |

Hourly historical aggregation.

---

# Search Console Synchronization

Purpose:

SEO monitoring.

## Synced Metrics

| Metric |
|--------|
| Total Clicks |
| Total Impressions |
| Average CTR |
| Average Position |
| Top Pages |
| Top Queries |
| Index Coverage |

Refreshed every six hours.

---

# Resend Synchronization

Purpose:

Email delivery monitoring.

## Metrics

- Sent.
- Delivered.
- Opened.
- Clicked.
- Bounce Rate.
- Complaint Rate.
- Retry Queue.

Operations dashboard receives aggregated totals.

---

# Sentry Synchronization

Purpose:

Application health.

## Synced Metrics

| Metric |
|--------|
| New Errors |
| Critical Errors |
| Error Rate |
| Performance Issues |
| Slow API Routes |
| Crash-Free Sessions |

Critical alerts surfaced immediately.

---

# Vercel Synchronization

Purpose:

Deployment monitoring.

## Synced Metrics

| Metric |
|--------|
| Latest Deployment |
| Deployment Status |
| Failed Deployments |
| Build Duration |
| Function Errors |
| Edge Runtime Status |

Operations deployment timeline uses cache.

---

# Supabase Health Monitoring

Metrics include:

- Database latency.
- Storage latency.
- Realtime status.
- Auth status.
- Edge Functions status.
- Cron execution health.

Queried via internal health endpoints.

---

# Storage Monitoring

Operations widgets include:

- Storage used.
- Bucket usage.
- Largest bucket.
- Download bandwidth.
- Upload bandwidth.
- File count.
- Daily growth.

Data refreshed every five minutes.

---

# Background Sync Engine

Purpose:

Collect third-party metrics.

## Sync Workers

| Worker | Frequency |
|--------|-----------|
| Stripe Sync | 30 Seconds |
| Razorpay Sync | 30 Seconds |
| Meta Sync | 5 Minutes |
| GA4 Sync | 5 Minutes |
| Search Console Sync | 6 Hours |
| Resend Sync | 1 Minute |
| Sentry Sync | 1 Minute |
| Vercel Sync | 2 Minutes |

Implemented using Edge Functions + Cron.

---

# Cache Tables

Operations Center never queries external APIs directly.

## Cache Tables

| Table |
|------|
| operations_kpis |
| operations_marketing_cache |
| operations_payments_cache |
| operations_email_cache |
| operations_storage_cache |
| operations_vercel_cache |
| operations_sentry_cache |
| operations_search_console_cache |

These tables power dashboard widgets.

---

# Cache Expiration Policy

| Cache | Refresh |
|-------|---------|
| Revenue | 30 Seconds |
| Marketing | 5 Minutes |
| Email | 1 Minute |
| Errors | 1 Minute |
| Deployments | 2 Minutes |
| SEO | 6 Hours |

Dashboard always reads cached values.

---

# Alert Engine

Purpose:

Generate operational alerts.

## Alert Categories

| Severity | Example |
|----------|---------|
| Critical | Stripe webhook failures |
| High | Revenue drop |
| High | Failed deployment |
| Medium | Email bounce spike |
| Medium | Storage above 80% |
| Low | Scheduled sync delayed |

Alerts stored in database.

---

# Alert Lifecycle

```text
System Event
     │
Alert Engine
     │
Operations Alerts Table
     │
Dashboard Widget
     │
Notification Center
```

Alerts acknowledged by admins.

---

# Health Score System

FinanceOS calculates overall platform health.

## Components

| Component | Weight |
|----------|--------|
| Payments | 25% |
| Website | 15% |
| Database | 15% |
| Storage | 10% |
| Marketing APIs | 10% |
| Email | 10% |
| Webhooks | 10% |
| Deployments | 5% |

Displayed as a health score.

---

# Revenue Aggregation Engine

Calculates:

- Today.
- Yesterday.
- Week.
- Month.
- Quarter.
- Year.
- Lifetime.

Supports multiple currencies.

---

# Marketing KPI Engine

Calculates:

- CAC.
- ROAS.
- CPA.
- CTR.
- CPC.
- Conversion Rate.
- Spend vs Revenue.

Used in Marketing dashboard.

---

# Operations Timeline

Timeline contains:

- Deployments.
- Webhook failures.
- Payment outages.
- Release publishes.
- Cron failures.
- Storage warnings.

Chronological event feed.

---

# Sync Failure Recovery

If synchronization fails:

1. Log failure.
2. Retry.
3. Increment retry count.
4. Create alert after threshold.
5. Continue previous cached value.

Dashboard never breaks due to API outage.

---

# Manual Refresh Actions

Admins may manually trigger:

- Stripe Sync.
- Razorpay Sync.
- Meta Sync.
- GA4 Sync.
- Resend Sync.
- Sentry Sync.

Manual refresh logged in audit history.

---

# Operations APIs

| Endpoint | Purpose |
|----------|---------|
| `/operations/dashboard` | Complete dashboard |
| `/operations/services` | Service health |
| `/operations/payments` | Payment metrics |
| `/operations/marketing` | Marketing metrics |
| `/operations/storage` | Storage metrics |
| `/operations/emails` | Email metrics |
| `/operations/errors` | Error metrics |
| `/operations/deployments` | Deployment history |
| `/operations/webhooks` | Webhook metrics |
| `/operations/alerts` | Alert feed |

All admin-protected.

---

# Audit Logging

Operations actions logged:

- Manual sync.
- Alert dismissal.
- Deployment acknowledgement.
- Refund initiated.
- Email resend.
- Feature toggle change.

Immutable audit trail.

---

# Security Rules

Operations Center:

- Admin access only.
- Super Admin for infrastructure settings.
- Read-only API keys stored server-side.
- No client access to provider tokens.

---

# Cursor Implementation Rules

Cursor must:

- Create cache tables.
- Build sync services.
- Implement cron schedules.
- Never call third-party APIs from browser.
- Expose unified Operations API.
- Calculate health score server-side.
- Generate alerts automatically.
- Log sync failures.
- Support manual sync actions.

---

# Frozen V1 Decisions

- Single Operations Center dashboard.
- Eight third-party integrations.
- Cache-first architecture.
- Background synchronization only.
- Health score system.
- Alert engine.
- Manual refresh support.
- Unified Operations API.
- Read-only provider dashboards.
- Live KPI refresh every 30 seconds.

All Operations Center backend decisions are frozen for V1.

---

# Next Document

**09_BACKGROUND_JOBS_AND_CRON.md**

The next backend specification defines:

- Supabase Cron architecture.
- Edge Function workers.
- Scheduled analytics aggregation.
- Email queue workers.
- Cleanup jobs.
- Storage cleanup.
- Cache refresh jobs.
- Retry workers.
- Notification workers.
- Daily/weekly/monthly scheduled tasks.
- Job monitoring and Operations Center integration.
