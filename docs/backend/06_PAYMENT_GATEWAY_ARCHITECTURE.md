# 06_PAYMENT_GATEWAY_ARCHITECTURE.md

## FinanceOS — Complete Payment Gateway Architecture & Checkout System Specification (V1)

**Document ID:** BACKEND-06

**Version:** 1.0 (Official V1)

**Status:** Frozen Payment Architecture

**Owner:** FinanceOS Architecture

**Repository Folder:** `/docs/backend`

---

# Purpose

This document defines the complete payment architecture for FinanceOS.

It specifies:

- Stripe integration architecture.
- Razorpay integration architecture.
- PPP (Purchasing Power Parity) pricing engine.
- Checkout lifecycle.
- Coupon engine integration.
- Tax handling.
- Invoice generation.
- Refund architecture.
- Settlement tracking.
- Multi-currency support.
- Payment reconciliation.
- Operations Center payment metrics.
- Security rules.
- Cursor implementation standards.

This is the **single source of truth** for all payment processing in FinanceOS.

---

# Dependencies

## Parent Backend Documents

- `00_BACKEND_MASTER.md`
- `01_SUPABASE_DATABASE_ARCHITECTURE.md`
- `02_AUTH_AND_SECURITY.md`
- `04_API_ARCHITECTURE.md`
- `05_WEBHOOK_ARCHITECTURE.md`

## Referenced Documents

- `05_PAYMENT_AND_COUPON_SYSTEM.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `11_OPERATIONS_CENTER_AND_INTEGRATIONS.md`

## Referenced Integration Documents

- /docs/integrations/01_STRIPE_INTEGRATION.md
- /docs/integrations/02_RAZORPAY_INTEGRATION.md

---

# Payment Stack (Frozen)

| Layer | Technology |
|--------|------------|
| International Payments | Stripe |
| India Payments | Razorpay |
| Currency Engine | FinanceOS PPP Service |
| Invoice Generator | Server-side PDF |
| Payment Storage | Supabase PostgreSQL |
| Payment Events | Webhooks |
| Refund Processing | Stripe / Razorpay APIs |

---

# Payment Philosophy

FinanceOS uses **gateway-native checkout**.

The application never stores card or UPI credentials.

Rules:

- Stripe Checkout handles international payments.
- Razorpay Checkout handles Indian payments.
- FinanceOS calculates price server-side.
- FinanceOS stores payment metadata only.
- Every successful payment creates a license.

---

# Payment Architecture Overview

```text
Customer
    │
Website Checkout
    │
FinanceOS API
    │
Pricing Engine
    │
Coupon Engine
    │
PPP Engine
    │
Stripe / Razorpay Checkout
    │
Webhook Verification
    │
Order Created
    │
License Generated
    │
Invoice Generated
    │
Download Enabled
```

Frozen lifecycle.

---

# Supported Payment Gateways

| Gateway | Region |
|---------|--------|
| Stripe | Global |
| Razorpay | India |

Gateway selection happens automatically.

---

# Gateway Selection Rules

| Customer Country | Gateway |
|------------------|---------|
| India | Razorpay |
| United States | Stripe |
| UK | Stripe |
| Europe | Stripe |
| UAE | Stripe |
| Singapore | Stripe |
| Australia | Stripe |

Customer can never manually switch gateways.

---

# Supported Payment Methods

## Stripe

- Credit Card
- Debit Card
- Apple Pay
- Google Pay
- Link
- Bank Payments (future)

## Razorpay

- UPI
- Credit Card
- Debit Card
- Net Banking
- Wallets
- EMI

---

# Checkout Lifecycle

## Complete Checkout Flow

```text
Product Page
      │
Pricing API
      │
Coupon Validation
      │
PPP Pricing
      │
Checkout Session
      │
Gateway Checkout
      │
Payment Success
      │
Webhook
      │
Order + License
      │
Customer Dashboard
```

---

# Checkout Session Creation

Endpoint:

```text
POST /api/checkout/create-session
```

Responsibilities:

- Authenticate customer.
- Validate product.
- Apply PPP pricing.
- Apply coupon.
- Calculate taxes.
- Select gateway.
- Create checkout session.

Returns checkout URL.

---

# Checkout Validation Rules

Server validates:

| Validation |
|-----------|
| Product Exists |
| Product Active |
| Release Published |
| Customer Logged In |
| Customer Email Verified |
| Coupon Valid |
| PPP Country Valid |

Checkout blocked if validation fails.

---

# PPP Pricing Engine

Purpose:

Offer regional pricing.

## PPP Flow

```text
Customer Country
      │
Country Rules
      │
PPP Multiplier
      │
Regional Price
      │
Coupon Applied
      │
Final Checkout Price
```

---

# PPP Rules Table

| Region | Pricing |
|--------|---------|
| India | PPP Discount |
| Pakistan | PPP Discount |
| Bangladesh | PPP Discount |
| Nepal | PPP Discount |
| Global | Base Price |

Values stored in database.

---

# Currency Support

| Currency |
|----------|
| INR |
| USD |
| GBP |
| EUR |
| AED |
| SGD |
| AUD |
| CAD |

Prices stored in base currency and converted server-side.

---

# Coupon Engine Integration

Coupons processed before checkout session.

Supported coupon types:

- Percentage.
- Fixed Amount.
- Launch Discount.
- Upgrade Discount.
- Referral Discount.

Coupons validated server-side only.

---

# Coupon Calculation Order

1. Base price.
2. PPP adjustment.
3. Coupon.
4. Tax.
5. Final amount.

This order is frozen.

---

# Stripe Checkout Architecture

Uses hosted Stripe Checkout.

## Checkout Metadata

FinanceOS sends:

- customer ID.
- product ID.
- release version.
- PPP region.
- coupon code.
- order reference.

Metadata returned in webhook.

---

# Razorpay Checkout Architecture

Uses Razorpay Order API.

Metadata includes:

- customer ID.
- order ID.
- product.
- coupon.
- PPP region.

Verified in webhook.

---

# Payment Status Lifecycle

| Status | Meaning |
|--------|---------|
| Created | Checkout initiated |
| Pending | Awaiting payment |
| Authorized | Authorized by gateway |
| Captured | Payment completed |
| Failed | Payment failed |
| Refunded | Refund completed |
| Cancelled | Checkout cancelled |

Frozen status values.

---

# Order Creation Rules

Orders created only after successful webhook verification.

Never trust client-side success callback.

---

# License Generation Rules

After successful payment:

- Create order.
- Create payment record.
- Create license.
- Enable download.
- Send email.
- Generate invoice.
- Notify customer.

Atomic transaction.

---

# Invoice Generation

Invoices generated automatically.

## Invoice Contains

- Invoice Number.
- Customer.
- Product.
- Version Purchased.
- Gateway.
- Currency.
- Tax.
- Discount.
- Total.
- Purchase Date.

Stored in `invoices` bucket.

---

# Invoice Number Format

```text
FIN-2026-000001
```

Rules:

- Prefix `FIN`.
- Year.
- Sequential number.

Immutable.

---

# Tax Handling

V1 strategy:

| Region | Tax |
|--------|-----|
| India | GST Ready |
| Global | Tax configurable |

Tax calculated server-side.

---

# Refund Architecture

Endpoint:

```text
POST /api/payments/refund
```

Admin initiated.

Flow:

1. Validate refund eligibility.
2. Call gateway refund API.
3. Update payment.
4. Update order.
5. Update analytics.
6. Notify customer.

---

# Refund Statuses

| Status |
|--------|
| Requested |
| Processing |
| Completed |
| Failed |
| Cancelled |

---

# Partial Refund Support

Architecture supports:

- Full refund.
- Partial refund.

V1 UI exposes full refund only.

---

# Settlement Tracking

Purpose:

Track gateway settlement lifecycle.

## Stored Information

- Gateway settlement ID.
- Amount settled.
- Fees.
- Taxes.
- Settlement date.
- Bank reference.

Razorpay only.

---

# Payment Failure Handling

Common failures:

| Failure |
|--------|
| Card Declined |
| UPI Failed |
| Gateway Timeout |
| Authentication Failed |
| Currency Unsupported |

Failures logged.

---

# Retry Checkout Rules

Customer may retry failed payment.

Rules:

- Same order reference.
- New payment attempt.
- Previous failed payment retained.

---

# Duplicate Payment Prevention

Protection via:

- Idempotency key.
- Existing order check.
- Webhook idempotency.
- Checkout session validation.

No duplicate licenses.

---

# Payment Analytics

Stored metrics:

- Revenue.
- Gateway split.
- Currency split.
- Country split.
- Refund rate.
- Conversion rate.
- Failed payments.

Feeds Analytics Dashboard.

---

# Operations Center Metrics

Widgets include:

- Today's Revenue.
- Stripe Revenue.
- Razorpay Revenue.
- Failed Payments.
- Refunds Today.
- Average Order Value.
- Gateway Health.

Live updates through cache.

---

# Payment Security Rules

Security requirements:

- Gateway secret server-side only.
- Webhook verification mandatory.
- Checkout session created server-side.
- No client-side pricing calculation.
- Idempotent refunds.
- Audit every payment mutation.

---

# PCI Compliance Strategy

FinanceOS never stores:

- Card number.
- CVV.
- UPI PIN.
- Bank credentials.

Handled entirely by gateways.

---

# Payment Environment Variables

Required secrets:

- Stripe Secret Key.
- Stripe Webhook Secret.
- Razorpay Key Secret.
- Razorpay Webhook Secret.
- PPP Configuration.

Documented separately.

---

# Payment Logging Strategy

Every payment logs:

- Order.
- Customer.
- Gateway.
- Currency.
- Coupon.
- PPP region.
- Tax.
- Metadata.
- Processing duration.

Immutable logs.

---

# Cursor Implementation Rules

Cursor must:

- Use hosted Stripe Checkout.
- Use Razorpay Orders API.
- Calculate prices server-side.
- Validate coupons before checkout.
- Apply PPP before coupon.
- Verify webhooks before creating orders.
- Generate invoices after payment success.
- Implement idempotent refunds.
- Record payment analytics.

---

# Frozen V1 Decisions

- Stripe + Razorpay only.
- Gateway auto-selection.
- PPP server-side pricing.
- Coupon-before-tax calculation.
- Hosted checkout pages.
- Webhook-driven order creation.
- Automatic invoice generation.
- Automatic license generation.
- Refund API for admins.
- Multi-currency support.

All payment architecture decisions are frozen for V1.

---

# Next Document

**07_EMAIL_SYSTEM_ARCHITECTURE.md**

The next backend specification defines:

- Resend integration.
- Transactional email system.
- Email template architecture.
- Purchase emails.
- Release notification emails.
- Password reset emails.
- Verification emails.
- Marketing email separation.
- Email analytics.
- Bounce handling.
- Suppression list.
- Email queue and retry system.
- Operations Center email monitoring.
