# 05_WEBHOOK_ARCHITECTURE.md

## FinanceOS — Complete Webhook Architecture & Event Processing Specification (V1)

**Document ID:** BACKEND-05

**Version:** 1.0 (Official V1)

**Status:** Frozen Webhook Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete webhook architecture for FinanceOS.

It specifies:

- Stripe webhook processing.
- Razorpay webhook processing.
- Resend webhook processing.
- Meta Conversion API events.
- Webhook verification.
- Idempotency.
- Retry system.
- Dead-letter queue.
- Event logging.
- Failure recovery.
- Operations Center monitoring.
- Security policies.
- Cursor implementation rules.

Every external service communicates with FinanceOS through secure webhook endpoints defined here.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `02_AUTH_AND_SECURITY.md`
- `04_API_ARCHITECTURE.md`

## Referenced Documents

- `06_PAYMENT_GATEWAY_ARCHITECTURE.md`
- `07_EMAIL_SYSTEM_ARCHITECTURE.md`
- `08_OPERATIONS_CENTER_BACKEND.md`

## Referenced Integration Documents

- /docs/integrations/01_STRIPE_INTEGRATION.md`
- /docs/integrations/02_RAZORPAY_INTEGRATION.md
- /docs/integrations/03_META_MARKETING_API.md
- /docs/integrations/06_RESEND_EMAIL_API.md

---

# Webhook Philosophy

FinanceOS uses **event-driven architecture** for external integrations.

External providers never modify the database directly.

Every webhook follows:

1. Receive event.
2. Verify signature.
3. Validate payload.
4. Check idempotency.
5. Process business logic.
6. Log event.
7. Update Operations Center.

No webhook bypasses this lifecycle.

---

# Supported Webhook Providers (V1)

| Provider | Purpose |
|----------|---------|
| Stripe | Payment events |
| Razorpay | Payment events |
| Resend | Email delivery events |
| Meta Conversion API | Marketing conversion events |

Future providers are V2.

---

# Webhook Endpoint Inventory

| Endpoint | Method |
|----------|--------|
| `/api/webhooks/stripe` | POST |
| `/api/webhooks/razorpay` | POST |
| `/api/webhooks/resend` | POST |
| `/api/webhooks/meta` | POST |

All endpoints are public but protected by signature verification.

---

# Global Webhook Lifecycle

```text id="tq2h9n"
External Provider
        │
Webhook Endpoint
        │
Signature Verification
        │
Schema Validation
        │
Idempotency Check
        │
Business Service
        │
Database Update
        │
Webhook Log
        │
Operations Center
```

Frozen lifecycle.

---

# Signature Verification Policy

Every webhook verifies authenticity before processing.

| Provider | Verification |
|----------|--------------|
| Stripe | Stripe Signature Header |
| Razorpay | HMAC SHA256 Signature |
| Resend | Signed Event Secret |
| Meta | Verify Token / Secret |

Failed verification returns **401 Unauthorized**.

---

# Stripe Webhook Events

Supported events:

| Event |
|------|
| checkout.session.completed |
| payment_intent.succeeded |
| payment_intent.payment_failed |
| charge.refunded |
| customer.created |
| customer.updated |

Only required events processed.

---

# Stripe Webhook Processing Flow

```text id="1nktvt"
Stripe Checkout Completed
        │
Verify Signature
        │
Find Order
        │
Create Payment Record
        │
Create License
        │
Enable Downloads
        │
Send Purchase Email
        │
Log Event
```

Atomic transaction required.

---

# Razorpay Webhook Events

Supported events:

| Event |
|------|
| payment.authorized |
| payment.captured |
| payment.failed |
| refund.processed |
| settlement.processed |

Mapped to FinanceOS payment states.

---

# Razorpay Processing Flow

1. Verify HMAC.
2. Validate payment.
3. Find order.
4. Capture payment metadata.
5. Create payment record.
6. Generate license.
7. Notify customer.

---

# Resend Webhook Events

Purpose:

Track transactional email lifecycle.

Supported events:

| Event |
|------|
| email.sent |
| email.delivered |
| email.opened |
| email.clicked |
| email.bounced |
| email.complained |

Updates email analytics tables.

---

# Email Event Processing

Updates:

- email_logs.
- email_events.
- analytics_email.
- notification_events.

Operations Center receives delivery metrics.

---

# Meta Conversion Events

Purpose:

Record successful conversions.

Events:

- Purchase.
- Checkout Started.
- Lead.
- Registration.

Stored for attribution analytics.

---

# Webhook Payload Validation

Every provider has dedicated validation schema.

Validation checks:

- Required fields.
- Event type.
- Timestamp.
- Signature fields.
- Provider IDs.

Invalid payloads rejected.

---

# Idempotency Strategy

Every webhook event processed **once only**.

## Idempotency Key Sources

| Provider | Key |
|----------|-----|
| Stripe | Event ID |
| Razorpay | Event ID |
| Resend | Event ID |
| Meta | Event ID |

Duplicate event returns success without reprocessing.

---

# Webhook Events Table

Database stores:

| Field |
|------|
| webhook_id |
| provider |
| event_type |
| external_event_id |
| payload |
| signature_verified |
| processed |
| processed_at |
| retry_count |
| error_message |

Immutable event history.

---

# Processing Status Enum

| Status |
|--------|
| Received |
| Verified |
| Processing |
| Completed |
| Failed |
| Retrying |
| Dead Letter |

Frozen values.

---

# Retry Policy

Retries only for recoverable failures.

| Failure | Retry |
|---------|-------|
| Database Timeout | Yes |
| Network Error | Yes |
| Provider Timeout | Yes |
| Validation Error | No |
| Signature Failure | No |

---

# Retry Schedule

| Attempt | Delay |
|---------|-------|
| First | 1 minute |
| Second | 5 minutes |
| Third | 15 minutes |
| Fourth | 1 hour |
| Fifth | 6 hours |

Maximum five retries.

---

# Dead-Letter Queue

Failed events move to dead-letter state.

Fields include:

- provider.
- event ID.
- failure reason.
- payload snapshot.
- last retry timestamp.

Manual replay available for admins.

---

# Webhook Replay Policy

Admins can replay failed webhook.

Rules:

- Signature already verified.
- Replay uses stored payload.
- Idempotency preserved.
- Replay logged separately.

No replay for successful events.

---

# Atomic Processing Rules

Critical webhook operations execute in one transaction.

Example:

1. Payment record.
2. Order update.
3. License creation.
4. Download permission.
5. Notification creation.

Rollback on failure.

---

# Webhook Security Rules

Security requirements:

- HTTPS only.
- Signature verification mandatory.
- Secret stored in environment variables.
- Timestamp tolerance enforced.
- Payload size limits enforced.

No anonymous processing.

---

# Timestamp Tolerance

Webhook timestamps must be recent.

| Provider | Tolerance |
|----------|-----------|
| Stripe | 5 Minutes |
| Razorpay | 5 Minutes |
| Resend | 10 Minutes |

Prevents replay attacks.

---

# Payload Size Limits

| Provider | Limit |
|----------|-------|
| Stripe | 1 MB |
| Razorpay | 1 MB |
| Resend | 512 KB |
| Meta | 512 KB |

Large payloads rejected.

---

# Webhook Logging Strategy

Logged information:

- provider.
- event type.
- request ID.
- processing duration.
- result.
- retry count.
- related order/customer.

Supports debugging.

---

# Operations Center Integration

Webhook metrics shown live.

Widgets include:

- Success Rate.
- Failed Events.
- Retry Queue.
- Dead Letter Count.
- Processing Latency.
- Events Per Minute.

Feeds Operations Center dashboard.

---

# Webhook Health Endpoints

Internal APIs:

| Endpoint |
|----------|
| `/operations/webhooks` |
| `/health/webhooks` |
| `/operations/webhook-health` |

Used by monitoring dashboard.

---

# Alert Conditions

Alerts created when:

- Signature failures spike.
- Retry queue grows.
- Dead-letter count exceeds threshold.
- Processing latency increases.
- Provider unreachable.

Severity mapped in Operations Center.

---

# Audit Logging

Webhook audit records include:

- provider.
- event ID.
- processing result.
- retry count.
- replay action.
- admin replay actor.

Immutable.

---

# Testing Strategy

Every webhook has:

- Local test payload.
- Signature verification test.
- Idempotency test.
- Retry simulation.
- Failure simulation.

Cursor must implement test fixtures.

---

# Cursor Implementation Rules

Cursor must:

- Verify signatures before parsing payload.
- Validate payload schema.
- Use idempotency table.
- Wrap critical operations in transactions.
- Log every webhook.
- Implement retry scheduler.
- Support dead-letter replay.
- Expose webhook health metrics to Operations Center.

---

# Frozen V1 Decisions

- Four webhook providers.
- Signature verification mandatory.
- Idempotency mandatory.
- Retry system with five attempts.
- Dead-letter queue enabled.
- Atomic payment processing.
- Operations Center monitoring.
- Immutable webhook logs.

All webhook architecture decisions are frozen for V1.

---

# Next Document

**06_PAYMENT_GATEWAY_ARCHITECTURE.md**

The next backend specification defines:

- Stripe architecture.
- Razorpay architecture.
- PPP pricing engine.
- Checkout session lifecycle.
- Refund architecture.
- Invoice generation.
- Tax handling.
- Coupon application flow.
- Payment reconciliation.
- Settlement tracking.
- Multi-currency support.
- Payment analytics integration.
