# 00_INTEGRATIONS_MASTER.md

## FinanceOS — External Integrations Master Architecture (V1)

**Document ID:** INTEGRATIONS-00

**Version:** 1.0 (Official V1)

**Status:** Frozen Integrations Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/integrations`

---

# Purpose

This document is the **master architecture document** for every external integration used by FinanceOS.

It defines:

- Integration philosophy.
- Supported third-party services.
- Integration architecture.
- Authentication strategy.
- Sync architecture.
- Webhook architecture.
- Operations Center integration map.
- Background synchronization strategy.
- Security standards.
- Environment variable ownership.
- Implementation order.

This document is the **single source of truth** for all external services connected to FinanceOS.

---

# Folder Purpose

The `/docs/integrations` folder documents **external providers only**.

The backend folder defines how FinanceOS works internally.

The integrations folder defines how FinanceOS communicates with external platforms.

---

# Dependencies

## Parent Architecture Documents

- `/docs/backend/04_API_ARCHITECTURE.md`
- `/docs/backend/05_WEBHOOK_ARCHITECTURE.md`
- `/docs/backend/06_PAYMENT_GATEWAY_ARCHITECTURE.md`
- `/docs/backend/07_EMAIL_SYSTEM_ARCHITECTURE.md`
- `/docs/backend/08_OPERATIONS_CENTER_BACKEND.md`
- `/docs/backend/09_BACKGROUND_JOBS_AND_CRON.md`
- `/docs/backend/10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`

## Referenced Admin Documents

- `/docs/admin/11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`
- `/docs/admin/07_ANALYTICS_AND_GROWTH_DASHBOARD.md`

---

# Integration Philosophy

FinanceOS follows a **Hub-and-Spoke Integration Architecture**.

External services never communicate directly with the frontend.

All communication flows through the FinanceOS backend.

```text
External Services
        │
        ▼
 FinanceOS Integration Layer
        │
        ▼
 Backend Services
        │
        ▼
 Database + Cache
        │
        ▼
 Operations Center Dashboard
```

The backend becomes the integration hub.

---

# Integration Principles (Frozen)

1. Backend owns every API request.
2. Frontend never stores provider secrets.
3. Operations Center reads cached provider data.
4. Webhooks verify authenticity before processing.
5. Every integration has retry and monitoring support.
6. All integrations feed centralized analytics.
7. Every provider has its own implementation document.

These principles are frozen for V1.

---

# Supported Integrations (V1)

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Integration</table-cell>
      <table-cell header>Purpose</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Stripe</table-cell>
    <table-cell>Global payments, refunds, payment analytics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Razorpay</table-cell>
    <table-cell>India payments, UPI, settlements.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Meta Marketing API</table-cell>
    <table-cell>Campaign metrics, spend, ROAS, Conversion API.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Google Analytics 4</table-cell>
    <table-cell>Website analytics and traffic reporting.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Google Search Console</table-cell>
    <table-cell>SEO metrics and search performance.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Resend</table-cell>
    <table-cell>Transactional email delivery and analytics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Sentry</table-cell>
    <table-cell>Error monitoring and performance tracking.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Vercel</table-cell>
    <table-cell>Deployment monitoring and runtime health.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Supabase Services</table-cell>
    <table-cell>Auth, Storage, Edge Functions, Cron, Realtime.</table-cell>
  </table-row>
</table>

These are the complete V1 integrations.

---

# Integration Ownership Matrix

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Service</table-cell>
      <table-cell header>Owned By</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Payments</table-cell>
    <table-cell>Backend Services</table-cell>
  </table-row>
  <table-row>
    <table-cell>Marketing Metrics</table-cell>
    <table-cell>Operations Sync Engine</table-cell>
  </table-row>
  <table-row>
    <table-cell>Email Delivery</table-cell>
    <table-cell>Email Service</table-cell>
  </table-row>
  <table-row>
    <table-cell>Deployments</table-cell>
    <table-cell>Operations Center</table-cell>
  </table-row>
  <table-row>
    <table-cell>Errors</table-cell>
    <table-cell>Monitoring Service</table-cell>
  </table-row>
  <table-row>
    <table-cell>Storage</table-cell>
    <table-cell>Supabase Storage Service</table-cell>
  </table-row>
</table>

---

# Integration Architecture Layers

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Layer</table-cell>
      <table-cell header>Responsibility</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Provider API</table-cell>
    <table-cell>Official third-party API.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Integration Service</table-cell>
    <table-cell>FinanceOS provider adapter.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Sync Worker</table-cell>
    <table-cell>Background synchronization.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Cache Layer</table-cell>
    <table-cell>Supabase cache tables.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Operations API</table-cell>
    <table-cell>Unified internal API.</table-cell>
  </table-row>
  <table-row>
    <table-cell>Admin Dashboard</table-cell>
    <table-cell>Operations Center UI.</table-cell>
  </table-row>
</table>

---

# Integration Flow Overview

```text
External Provider
        │
Authentication
        │
FinanceOS Integration Service
        │
Background Sync Worker
        │
Supabase Cache Tables
        │
Operations Center APIs
        │
Admin Dashboard Widgets
```

Every provider follows this lifecycle.

---

# Provider Authentication Strategy

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Provider</table-cell>
      <table-cell header>Authentication Method</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Stripe</table-cell>
    <table-cell>Secret API Key + Webhook Secret</table-cell>
  </table-row>
  <table-row>
    <table-cell>Razorpay</table-cell>
    <table-cell>Key Secret + HMAC Webhook Secret</table-cell>
  </table-row>
  <table-row>
    <table-cell>Meta</table-cell>
    <table-cell>Access Token + App Secret</table-cell>
  </table-row>
  <table-row>
    <table-cell>GA4</table-cell>
    <table-cell>Service Account Credentials</table-cell>
  </table-row>
  <table-row>
    <table-cell>Search Console</table-cell>
    <table-cell>Service Account Credentials</table-cell>
  </table-row>
  <table-row>
    <table-cell>Resend</table-cell>
    <table-cell>API Key + Webhook Secret</table-cell>
  </table-row>
  <table-row>
    <table-cell>Sentry</table-cell>
    <table-cell>Auth Token</table-cell>
  </table-row>
  <table-row>
    <table-cell>Vercel</table-cell>
    <table-cell>API Token</table-cell>
  </table-row>
</table>

All secrets remain server-side.

---

# Integration Categories

## Payment Integrations

Purpose:

Revenue generation.

Includes:

- Stripe
- Razorpay

Feeds:

- Orders
- Payments
- Analytics
- Operations Center

---

## Marketing Integrations

Purpose:

Growth analytics.

Includes:

- Meta Marketing API
- GA4
- Search Console

Feeds:

- Analytics Dashboard
- Operations Center
- Marketing Reports

---

## Communication Integrations

Purpose:

Customer communication.

Includes:

- Resend

Feeds:

- Email Dashboard
- Notification Center
- Operations Center

---

## Infrastructure Integrations

Purpose:

Platform monitoring.

Includes:

- Supabase
- Vercel
- Sentry

Feeds:

- Operations Center
- Health Dashboard
- Alert Engine

---

# Operations Center Integration Map

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Operations Widget</table-cell>
      <table-cell header>Provider Source</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Revenue Today</table-cell>
    <table-cell>Stripe + Razorpay</table-cell>
  </table-row>
  <table-row>
    <table-cell>Orders Today</table-cell>
    <table-cell>Supabase Database</table-cell>
  </table-row>
  <table-row>
    <table-cell>Marketing Spend</table-cell>
    <table-cell>Meta API</table-cell>
  </table-row>
  <table-row>
    <table-cell>Website Sessions</table-cell>
    <table-cell>GA4</table-cell>
  </table-row>
  <table-row>
    <table-cell>SEO Performance</table-cell>
    <table-cell>Search Console</table-cell>
  </table-row>
  <table-row>
    <table-cell>Email Delivery</table-cell>
    <table-cell>Resend</table-cell>
  </table-row>
  <table-row>
    <table-cell>Storage Usage</table-cell>
    <table-cell>Supabase Storage</table-cell>
  </table-row>
  <table-row>
    <table-cell>Deployment Status</table-cell>
    <table-cell>Vercel API</table-cell>
  </table-row>
  <table-row>
    <table-cell>Application Errors</table-cell>
    <table-cell>Sentry</table-cell>
  </table-row>
</table>

Operations Center becomes the unified dashboard.

---

# Synchronization Strategy

No provider is queried directly from the frontend.

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Provider</table-cell>
      <table-cell header>Sync Frequency</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Stripe</table-cell>
    <table-cell>30 Seconds</table-cell>
  </table-row>
  <table-row>
    <table-cell>Razorpay</table-cell>
    <table-cell>30 Seconds</table-cell>
  </table-row>
  <table-row>
    <table-cell>Meta</table-cell>
    <table-cell>5 Minutes</table-cell>
  </table-row>
  <table-row>
    <table-cell>GA4</table-cell>
    <table-cell>5 Minutes</table-cell>
  </table-row>
  <table-row>
    <table-cell>Search Console</table-cell>
    <table-cell>6 Hours</table-cell>
  </table-row>
  <table-row>
    <table-cell>Resend</table-cell>
    <table-cell>1 Minute</table-cell>
  </table-row>
  <table-row>
    <table-cell>Sentry</table-cell>
    <table-cell>1 Minute</table-cell>
  </table-row>
  <table-row>
    <table-cell>Vercel</table-cell>
    <table-cell>2 Minutes</table-cell>
  </table-row>
</table>

Sync jobs are defined in `/docs/backend/09_BACKGROUND_JOBS_AND_CRON.md`.

---

# Cache Architecture

Every provider syncs into dedicated cache tables.

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Cache Table</table-cell>
      <table-cell header>Provider</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>operations_payments_cache</table-cell>
    <table-cell>Stripe / Razorpay</table-cell>
  </table-row>
  <table-row>
    <table-cell>operations_marketing_cache</table-cell>
    <table-cell>Meta / GA4 / Search Console</table-cell>
  </table-row>
  <table-row>
    <table-cell>operations_email_cache</table-cell>
    <table-cell>Resend</table-cell>
  </table-row>
  <table-row>
    <table-cell>operations_storage_cache</table-cell>
    <table-cell>Supabase Storage</table-cell>
  </table-row>
  <table-row>
    <table-cell>operations_vercel_cache</table-cell>
    <table-cell>Vercel</table-cell>
  </table-row>
  <table-row>
    <table-cell>operations_sentry_cache</table-cell>
    <table-cell>Sentry</table-cell>
  </table-row>
</table>

Frontend always reads cached values.

---

# Webhook Providers

FinanceOS receives incoming events from:

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Provider</table-cell>
      <table-cell header>Purpose</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Stripe</table-cell>
    <table-cell>Payment events</table-cell>
  </table-row>
  <table-row>
    <table-cell>Razorpay</table-cell>
    <table-cell>Payment events</table-cell>
  </table-row>
  <table-row>
    <table-cell>Resend</table-cell>
    <table-cell>Email delivery events</table-cell>
  </table-row>
  <table-row>
    <table-cell>Meta</table-cell>
    <table-cell>Conversion API events</table-cell>
  </table-row>
</table>

Webhook implementation is documented separately.

---

# Background Workers

Each provider has dedicated synchronization workers.

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Worker</table-cell>
      <table-cell header>Responsibility</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>stripe-sync-worker</table-cell>
    <table-cell>Revenue and payment metrics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>razorpay-sync-worker</table-cell>
    <table-cell>Settlement and payment metrics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>marketing-sync-worker</table-cell>
    <table-cell>Meta campaign metrics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>ga4-sync-worker</table-cell>
    <table-cell>Website analytics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>gsc-sync-worker</table-cell>
    <table-cell>SEO metrics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>email-sync-worker</table-cell>
    <table-cell>Email analytics.</table-cell>
  </table-row>
  <table-row>
    <table-cell>sentry-sync-worker</table-cell>
    <table-cell>Error monitoring.</table-cell>
  </table-row>
  <table-row>
    <table-cell>vercel-sync-worker</table-cell>
    <table-cell>Deployment monitoring.</table-cell>
  </table-row>
</table>

Workers update cache tables.

---

# Integration Security Standards

Every provider must follow these rules.

## Rules

- Secrets stored in environment variables.
- HTTPS only.
- Webhook signatures verified.
- Idempotency enforced.
- Rate limits respected.
- Retry transient failures.
- Log every API request and webhook event.

These standards are mandatory.

---

# Retry & Failure Handling

Every integration implements:

- Retry queue.
- Dead-letter queue.
- Failure logging.
- Alert creation.
- Manual replay (where applicable).

Operations Center monitors all failures.

---

# Environment Variable Ownership

<table columnSizing="equal">
  <table-section header>
    <table-row header>
      <table-cell header>Provider</table-cell>
      <table-cell header>Environment Document</table-cell>
    </table-row>
  </table-section>
  <table-row>
    <table-cell>Stripe</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
  <table-row>
    <table-cell>Razorpay</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
  <table-row>
    <table-cell>Meta</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
  <table-row>
    <table-cell>GA4</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
  <table-row>
    <table-cell>Search Console</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
  <table-row>
    <table-cell>Resend</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
  <table-row>
    <table-cell>Sentry</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
  <table-row>
    <table-cell>Vercel</table-cell>
    <table-cell>`10_ENVIRONMENT_VARIABLES_AND_SECRETS.md`</table-cell>
  </table-row>
</table>

Secrets are documented once.

---

# Integration Folder Structure

```text
/docs/integrations

00_INTEGRATIONS_MASTER.md
01_STRIPE_INTEGRATION.md
02_RAZORPAY_INTEGRATION.md
03_META_MARKETING_API.md
04_GOOGLE_ANALYTICS_4.md
05_GOOGLE_SEARCH_CONSOLE.md
06_RESEND_EMAIL_API.md
07_SENTRY_MONITORING.md
08_VERCEL_DEPLOYMENT_API.md
09_SUPABASE_SERVICES.md
10_OPERATIONS_SYNC_ENGINE.md
11_INTEGRATION_IMPLEMENTATION_CHECKLIST.md
```

This structure is frozen.

---

# Documentation Standards

Every integration document contains the same major sections.

## Standard Template

1. Purpose
2. Dependencies
3. Architecture Overview
4. Authentication
5. API Endpoints Used
6. Webhook Events (if applicable)
7. Database Tables Used
8. Background Workers
9. Operations Center Widgets
10. Security Rules
11. Error Handling
12. Testing Strategy
13. Cursor Implementation Rules
14. Frozen Decisions

All integration documents follow this format.

---

# Cursor Responsibilities

Cursor must:

- Treat each integration as a provider adapter.
- Never expose provider secrets.
- Use shared retry utilities.
- Use shared logging utilities.
- Update cache tables instead of frontend polling.
- Feed Operations Center APIs.
- Respect rate limits and idempotency rules.

---

# Frozen V1 Decisions

- Nine external providers.
- One integration document per provider.
- Operations Center is the unified dashboard.
- Backend owns every provider connection.
- Cache-first synchronization architecture.
- Shared security standards across providers.
- Shared documentation template.
- Shared retry and monitoring strategy.

All integration architecture decisions are frozen for FinanceOS V1.

---

# Next Document

**01_STRIPE_INTEGRATION.md**

The next document defines the complete Stripe implementation for FinanceOS, including:

- Stripe account configuration.
- Checkout Session architecture.
- Payment Intent lifecycle.
- Refund architecture.
- Webhook verification.
- Metadata mapping.
- Invoice generation.
- Payment analytics.
- Operations Center widgets.
- Testing with Stripe Test Mode.
- Production configuration.
- Cursor implementation rules.
