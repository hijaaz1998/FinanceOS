# 09_BACKGROUND_JOBS_AND_CRON.md

## FinanceOS — Background Jobs, Edge Functions & Cron Architecture Specification (V1)

**Document ID:** BACKEND-09

**Version:** 1.0 (Official V1)

**Status:** Frozen Background Processing Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete background job architecture for FinanceOS using **Supabase Edge Functions** and **Supabase Cron**.

It specifies:

- Background worker architecture.
- Edge Function responsibilities.
- Cron schedules.
- Queue processing.
- Email workers.
- Analytics aggregation workers.
- Operations Center synchronization jobs.
- Cleanup jobs.
- Retry jobs.
- Notification workers.
- Report generation workers.
- Monitoring and alerting.
- Cursor implementation rules.

This document is the **single source of truth** for every scheduled or asynchronous task in FinanceOS.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `04_API_ARCHITECTURE.md`
- `07_EMAIL_SYSTEM_ARCHITECTURE.md`
- `08_OPERATIONS_CENTER_BACKEND.md`

## Referenced Documents

- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`
- `07_ANALYTICS_AND_GROWTH_DASHBOARD.md`


## Referenced Integration Documents

- /docs/integrations/10_OPERATIONS_SYNC_ENGINE.md
- /docs/integrations/09_SUPABASE_SERVICES.md

---

# Background Processing Stack (Frozen)

| Layer | Technology |
|--------|------------|
| Background Workers | Supabase Edge Functions |
| Scheduler | Supabase Cron |
| Queue Storage | PostgreSQL Queue Tables |
| Retry System | Queue Workers |
| Monitoring | Operations Center |
| Alerts | Operations Alerts Engine |

---

# Background Job Philosophy

Background jobs execute **outside the user request lifecycle**.

Rules:

- Never block customer requests.
- Never block checkout.
- Never block downloads.
- Retry recoverable failures.
- Log every execution.
- Monitor job health.

---

# Background Architecture Overview

```text
Customer / Admin Action
        │
Database Queue
        │
Edge Function Worker
        │
Business Service
        │
Database Update
        │
Operations Center Metrics
```

Cron triggers workers.

Workers process queues.

---

# Background Job Categories

| Category | Purpose |
|----------|---------|
| Email Workers | Send queued emails |
| Analytics Workers | Aggregate KPIs |
| Operations Workers | Sync third-party APIs |
| Cleanup Workers | Remove temporary data |
| Retry Workers | Retry failed jobs |
| Notification Workers | Create notifications |
| Release Workers | Notify customers of releases |
| Report Workers | Generate exports |
| Maintenance Workers | System housekeeping |

---

# Edge Function Folder Structure

```text
supabase/functions/

email-worker/
analytics-worker/
operations-sync/
cleanup-worker/
notification-worker/
release-worker/
export-worker/
retry-worker/
health-worker/
maintenance-worker/
```

One responsibility per worker.

---

# Cron Schedule Overview

| Frequency | Purpose |
|-----------|---------|
| Every 30 Seconds | Revenue & payment sync |
| Every Minute | Email queue, alerts |
| Every 5 Minutes | Marketing sync |
| Every Hour | Analytics aggregation |
| Daily | Reports & cleanup |
| Weekly | Storage optimization |
| Monthly | Archive & maintenance |

Schedules are frozen.

---

# Email Queue Worker

Purpose:

Send queued transactional emails.

## Responsibilities

- Fetch pending emails.
- Send through Resend.
- Update email_logs.
- Retry failures.
- Log execution.

Runs every minute.

---

# Email Retry Worker

Processes failed email deliveries.

Rules:

- Retry transient failures.
- Max five attempts.
- Move permanent failures to dead-letter queue.
- Notify Operations Center on repeated failures.

Runs every five minutes.

---

# Analytics Aggregation Worker

Purpose:

Aggregate business metrics.

## Calculates

- Daily revenue.
- Weekly revenue.
- Monthly revenue.
- Product revenue.
- Customer growth.
- Download metrics.
- Conversion metrics.
- Retention metrics.

Runs hourly.

---

# Revenue Aggregation Worker

Updates:

- analytics_daily_revenue
- analytics_products
- analytics_customers

Creates cached summaries for dashboards.

---

# Marketing Sync Worker

Purpose:

Synchronize Meta Marketing API.

Updates:

- Campaign spend.
- Impressions.
- Clicks.
- Purchases.
- ROAS.
- CTR.
- CPC.

Runs every five minutes.

---

# Google Analytics Worker

Purpose:

Synchronize GA4.

Updates cached metrics:

- Sessions.
- Active users.
- Bounce rate.
- Traffic sources.
- Devices.
- Countries.

Runs every five minutes.

---

# Search Console Worker

Purpose:

SEO metrics.

Updates:

- Clicks.
- Impressions.
- Average position.
- Top pages.
- Top keywords.

Runs every six hours.

---

# Stripe Sync Worker

Purpose:

Payment synchronization.

Updates:

- Today's revenue.
- Failed payments.
- Refunds.
- Pending payments.
- Average order value.

Runs every thirty seconds.

---

# Razorpay Sync Worker

Purpose:

India payment metrics.

Updates:

- Settlements.
- UPI revenue.
- Failed UPI payments.
- Refunds.
- Gateway latency.

Runs every thirty seconds.

---

# Operations Cache Worker

Purpose:

Refresh Operations Center cache tables.

Updates:

- operations_kpis
- operations_marketing_cache
- operations_email_cache
- operations_storage_cache
- operations_payments_cache

Runs every minute.

---

# Notification Worker

Purpose:

Create queued notifications.

Triggers:

- Purchase completed.
- Refund completed.
- Release published.
- Password changed.
- Security alerts.
- Admin alerts.

Runs every minute.

---

# Release Notification Worker

Purpose:

Notify licensed customers.

Flow:

1. Detect published release.
2. Find licensed customers.
3. Queue notifications.
4. Queue emails.
5. Log campaign.

Runs immediately after publish.

---

# Report Generation Worker

Purpose:

Generate downloadable reports.

Supported exports:

| Export |
|--------|
| Revenue CSV |
| Customer CSV |
| Orders CSV |
| Analytics PDF |
| Payment XLSX |

Runs on demand.

---

# Export Cleanup Worker

Purpose:

Delete expired exports.

Rules:

- Older than 24 hours.
- Delete storage object.
- Delete metadata.
- Log cleanup.

Runs daily.

---

# Temporary Storage Cleanup Worker

Purpose:

Remove temporary uploads.

Targets:

- Avatar drafts.
- Workbook drafts.
- Image editor uploads.
- CSV imports.

Runs daily.

---

# Storage Optimization Worker

Purpose:

Maintain storage health.

Tasks:

- Remove orphaned metadata.
- Remove unused thumbnails.
- Calculate storage usage.
- Update Operations metrics.

Runs weekly.

---

# Retry Queue Worker

Purpose:

Retry failed jobs.

Supports:

- Email retries.
- Webhook retries.
- Analytics retries.
- Sync retries.

Uses exponential backoff schedule.

Runs every five minutes.

---

# Dead-Letter Cleanup Worker

Purpose:

Archive failed jobs.

Tasks:

- Archive completed retries.
- Keep dead-letter history.
- Notify admins for unresolved failures.

Runs daily.

---

# Health Monitoring Worker

Purpose:

Check infrastructure health.

Checks:

- Database latency.
- Storage availability.
- Auth availability.
- Realtime availability.
- Edge Functions.
- Cron execution.

Runs every minute.

---

# Cron Monitoring Worker

Purpose:

Ensure scheduled jobs execute.

Tracks:

- Last execution.
- Duration.
- Success rate.
- Failure count.
- Missed schedules.

Feeds Operations dashboard.

---

# Daily Summary Worker

Runs every morning.

Creates:

- Revenue summary.
- Customer summary.
- Marketing summary.
- Storage summary.
- Error summary.

Queues admin digest email.

---

# Weekly Summary Worker

Runs every Monday.

Generates:

- Weekly revenue report.
- Growth metrics.
- Campaign performance.
- Top products.
- Refund summary.

Stored as report.

---

# Monthly Maintenance Worker

Runs first day of month.

Tasks:

- Archive analytics snapshots.
- Cleanup expired notifications.
- Rotate logs.
- Generate monthly report.
- Storage audit.

---

# Queue Architecture

Queues stored in PostgreSQL.

## Queue Tables

| Queue |
|------|
| email_queue |
| notification_queue |
| report_queue |
| retry_queue |
| sync_queue |

Workers consume queues asynchronously.

---

# Queue Status Enum

| Status |
|--------|
| Pending |
| Processing |
| Completed |
| Failed |
| Retrying |
| Dead Letter |

Frozen values.

---

# Job Execution Logging

Every worker logs:

- Job ID.
- Worker name.
- Start time.
- End time.
- Duration.
- Status.
- Retry count.
- Error message.

Stored in operations_sync_logs.

---

# Job Timeout Policy

| Worker | Timeout |
|--------|---------|
| Email Worker | 60 seconds |
| Analytics Worker | 120 seconds |
| Marketing Worker | 120 seconds |
| Report Worker | 300 seconds |
| Cleanup Worker | 180 seconds |

Timeouts trigger retries when appropriate.

---

# Retry Strategy

Recoverable jobs retry.

| Attempt | Delay |
|---------|-------|
| 1 | 1 Minute |
| 2 | 5 Minutes |
| 3 | 15 Minutes |
| 4 | 1 Hour |
| 5 | 6 Hours |

Maximum five retries.

---

# Alert Conditions

Create alerts when:

- Worker fails repeatedly.
- Queue backlog exceeds threshold.
- Cron missed schedule.
- Job duration exceeds SLA.
- Retry queue grows.

Alerts appear in Operations Center.

---

# Operations Center Integration

Operations widgets include:

- Active Jobs.
- Failed Jobs.
- Retry Queue.
- Queue Size.
- Last Successful Sync.
- Cron Success Rate.
- Worker Health.

Live monitoring dashboard.

---

# Background Job Metrics

Tracked metrics:

- Jobs executed.
- Average duration.
- Success percentage.
- Retry percentage.
- Failure percentage.
- Queue processing time.

Historical analytics stored separately.

---

# Security Rules

Background workers:

- Use Service Role securely.
- Never expose secrets.
- Never accept public requests.
- Validate queued payloads.
- Log privileged operations.

---

# Failure Recovery Strategy

If worker fails:

1. Record failure.
2. Retry if recoverable.
3. Increment retry count.
4. Create alert after threshold.
5. Preserve payload.

No silent failures.

---

# Cursor Implementation Rules

Cursor must:

- Implement Edge Functions separately.
- Schedule cron jobs using Supabase Cron.
- Use PostgreSQL queue tables.
- Log every execution.
- Retry recoverable failures.
- Feed Operations Center metrics.
- Archive dead-letter jobs.
- Keep workers idempotent.

---

# Frozen V1 Decisions

- Supabase Edge Functions only.
- Supabase Cron scheduler.
- Queue-driven asynchronous processing.
- Five retry attempts.
- Dead-letter queue.
- Operations Center monitoring.
- Daily/weekly/monthly maintenance workers.
- Cache refresh workers.
- Health monitoring workers.

All background processing decisions are frozen for V1.

---

# Next Document

**10_ENVIRONMENT_VARIABLES_AND_SECRETS.md**

The next backend specification defines:

- Complete environment variable inventory.
- Public vs server secrets.
- Stripe secrets.
- Razorpay secrets.
- Supabase keys.
- Resend keys.
- Meta tokens.
- Google Analytics credentials.
- Search Console credentials.
- Sentry tokens.
- Vercel environment configuration.
- Development vs Production environments.
- Secret rotation policy.
- Cursor environment setup rules.
