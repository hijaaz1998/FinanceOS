# 05_PAYMENT_AND_COUPON_SYSTEM.md

## FinanceOS — Payment Gateway, PPP Pricing & Coupon Management Specification

**Document ID:** WEB-ADMIN-05

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Payment & Coupon System)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/admin`

---

## Dependencies

- `00_ADMIN_MASTER.md`
- `03_ORDER_AND_LICENSE_MANAGEMENT.md`
- `04_PRODUCT_RELEASE_MANAGEMENT.md`
- `docs/web/user/07_PRICING_AND_PPP_SYSTEM.md`
- `docs/web/user/09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`

---

# Purpose

This document defines the complete **Payment Operations, PPP Pricing Management, Coupon System, Discount Campaigns, Revenue Tracking, and Payment Gateway Administration** inside the FinanceOS Admin Portal.

The module allows administrators to:

- Monitor Razorpay and Stripe payments.
- Manage Purchasing Power Parity (PPP) pricing.
- Create and manage coupons.
- Configure discount campaigns.
- View payment analytics.
- Process failed payments.
- Configure regional pricing.

This document is the **single source of truth** for Cursor when implementing payment operations.

---

# Payment System Philosophy

FinanceOS supports **one global pricing model with regional purchasing power adjustments**.

Core principles:

- One product.
- One checkout experience.
- Region-specific pricing.
- Transparent discounts.
- Secure payment verification.

Payments should require **zero manual intervention** for successful purchases.

---

# Payment Architecture Overview

```text
Customer Checkout
        │
        ▼
Region Detection
        │
        ▼
PPP Pricing Engine
        │
        ▼
Gateway Selection
   ├── Razorpay (India)
   └── Stripe (International)
        │
        ▼
Webhook Verification
        │
        ▼
Order + License + Downloads
```

This payment architecture is frozen.

---

# Payment Module Overview

| Section | Purpose |
|--------|---------|
| Payment Dashboard | Revenue overview and gateway health. |
| Razorpay Center | India payment management. |
| Stripe Center | International payment management. |
| PPP Pricing Center | Regional pricing management. |
| Coupon Center | Coupon creation and management. |
| Campaign Center | Promotional campaigns. |
| Failed Payments | Failed payment monitoring. |
| Revenue Analytics | Revenue breakdowns. |

---

# Payment Dashboard

Top dashboard displays operational KPIs.

## KPI Cards

| KPI | Description |
|-----|-------------|
| Total Revenue | Lifetime revenue. |
| Revenue Today | Today's revenue. |
| Revenue This Month | Monthly revenue. |
| Average Order Value | Average payment amount. |
| Successful Payments | Completed transactions. |
| Failed Payments | Failed transactions. |
| Refund Amount | Total refunded revenue. |
| Gateway Health | Razorpay & Stripe status. |

---

# Payment Dashboard Layout

Sections:

1. KPI Cards.
2. Revenue Chart.
3. Gateway Breakdown.
4. Recent Payments.
5. Failed Payments.
6. Coupon Performance.

---

# Payment Search System

Search supports:

| Search | Example |
|--------|---------|
| Order ID | ORD-2026-000145 |
| Payment ID | pay_MX12345 |
| Customer Email | user@example.com |
| Invoice Number | INV-2026-000145 |
| Coupon Code | EARLY50 |

Universal payment search.

---

# Payment Filter System

| Filter | Options |
|--------|---------|
| Gateway | Razorpay / Stripe |
| Status | Success / Failed / Refunded |
| Currency | INR / USD / GBP / EUR |
| Country | Customer country |
| Coupon Used | Yes / No |
| Date Range | Custom range |

---

# Revenue Overview Chart

Displays revenue over time.

Metrics:

- Daily.
- Weekly.
- Monthly.
- Yearly.

Shared chart component.

---

# Revenue Breakdown Cards

| Metric | Description |
|--------|-------------|
| Gross Revenue | Before refunds. |
| Net Revenue | After refunds. |
| Refund Value | Total refunds. |
| Discount Value | Coupons applied. |
| Gateway Fees | Payment gateway fees (future). |

---

# Payment Table

Master payment table.

## Columns

| Column | Description |
|--------|-------------|
| Payment ID | Gateway payment ID |
| Order ID | Linked order |
| Customer | Customer name |
| Gateway | Razorpay / Stripe |
| Currency | Currency paid |
| Amount | Final amount |
| Status | Success / Failed |
| Timestamp | Payment date |
| Action | View Details |

---

# Payment Status System

| Status | Meaning |
|--------|---------|
| Pending | Awaiting verification. |
| Successful | Payment completed. |
| Failed | Payment failed. |
| Refunded | Payment refunded. |
| Cancelled | Checkout cancelled. |

Shared status badge system.

---

# Razorpay Center

Purpose:

Manage India payments.

---

## Razorpay Dashboard KPIs

| KPI | Description |
|-----|-------------|
| Total INR Revenue | INR revenue. |
| Successful UPI Payments | Count. |
| Card Payments | Count. |
| Wallet Payments | Count. |
| Failed Razorpay Payments | Count. |

---

## Razorpay Payment Methods

Supported methods.

| Method | Version 1 |
|--------|-----------|
| UPI | Yes |
| Credit Card | Yes |
| Debit Card | Yes |
| Net Banking | Yes |
| Wallets | Yes |

---

# Razorpay Transaction Detail

Displays:

- Razorpay Payment ID.
- Razorpay Order ID.
- Signature verification.
- Method.
- Currency.
- Amount.
- Status.

Read-only gateway metadata.

---

# Stripe Center

Purpose:

Manage international payments.

---

## Stripe Dashboard KPIs

| KPI | Description |
|-----|-------------|
| USD Revenue | Revenue in USD. |
| GBP Revenue | Revenue in GBP. |
| EUR Revenue | Revenue in EUR. |
| Successful Stripe Payments | Count. |
| Failed Stripe Payments | Count. |

---

## Stripe Payment Methods

| Method | Version 1 |
|--------|-----------|
| Visa | Yes |
| Mastercard | Yes |
| Apple Pay | Yes |
| Google Pay | Yes |
| Link | Yes |

---

# Stripe Transaction Detail

Displays:

- Checkout Session ID.
- Payment Intent ID.
- Customer Email.
- Currency.
- Amount.
- Status.

---

# PPP Pricing Center

Purpose:

Manage regional pricing.

---

# PPP Philosophy

Customers pay a region-adjusted price while owning the same product.

PPP never changes product features.

---

# PPP Region Table

| Region | Currency | PPP Enabled |
|--------|----------|-------------|
| India | INR | Yes |
| USA | USD | Yes |
| UK | GBP | Yes |
| Europe | EUR | Yes |
| Canada | CAD | Future |
| Australia | AUD | Future |

---

# PPP Pricing Table

| Region | Base Price | Local Price |
|--------|------------|-------------|
| India | ₹X | ₹PPP Price |
| USA | $X | $Standard |
| UK | £X | £Standard |
| Europe | €X | €Standard |

Admin edits PPP values here.

---

# PPP Rules

Version 1 rules.

| Rule | Value |
|------|-------|
| Auto Detect Country | Yes |
| Manual Currency Switch | Yes |
| Customer Override | Allowed |
| Price Stored at Purchase | Yes |

Price never changes for completed orders.

---

# PPP Edit Workflow

```text
Admin Updates PPP
        │
Validation
        │
Publish PPP Prices
        │
Pricing Page Updated
        │
Checkout Updated
```

No deployment required.

---

# Coupon Center

Purpose:

Create and manage discount coupons.

---

## Coupon Dashboard KPIs

| KPI | Description |
|-----|-------------|
| Active Coupons | Currently usable. |
| Scheduled Coupons | Future campaigns. |
| Expired Coupons | Historical coupons. |
| Total Coupon Redemptions | Lifetime usage. |
| Revenue from Coupons | Discount campaign revenue. |

---

# Coupon Table

| Column | Description |
|--------|-------------|
| Coupon Code | Discount code |
| Discount | Amount or percentage |
| Type | Fixed / Percentage |
| Status | Active / Expired |
| Usage | Current usage count |
| Expiry Date | Expiration |
| Actions | Edit / Disable |

---

# Coupon Types

| Type | Description |
|------|-------------|
| Percentage Discount | Example: 20% OFF |
| Fixed Amount Discount | Example: ₹500 OFF |
| PPP Override Coupon | Future reserved |
| Free Access Coupon | Internal use |

---

# Coupon Creation Form

Required fields.

| Field | Required |
|-------|----------|
| Coupon Code | Yes |
| Coupon Name | Yes |
| Discount Type | Yes |
| Discount Value | Yes |
| Start Date | Yes |
| Expiry Date | Yes |
| Usage Limit | Yes |
| Region Restriction | Optional |
| Minimum Purchase | Optional |

---

# Coupon Naming Convention

Examples:

```text
EARLY50
LAUNCH20
FINANCEOS100
INDIA15
BLACKFRIDAY25
```

Uppercase only.

---

# Coupon Validation Rules

Coupon valid if:

- Active.
- Within date range.
- Usage limit not exceeded.
- Region allowed.
- Purchase minimum satisfied.

---

# Coupon Status System

| Status | Meaning |
|--------|---------|
| Draft | Not published. |
| Scheduled | Future activation. |
| Active | Redeemable. |
| Expired | Automatically expired. |
| Disabled | Admin disabled. |

---

# Coupon Usage Limits

Supported limits.

| Limit | Version 1 |
|------|-----------|
| Unlimited | Yes |
| Total Usage Count | Yes |
| Per Customer Limit | Yes |

---

# Coupon Eligibility Rules

Coupons may be restricted by:

- Country.
- Currency.
- Purchase amount.
- Campaign dates.

Version 1 supports all four.

---

# Coupon Performance Dashboard

Metrics:

| Metric | Description |
|--------|-------------|
| Total Uses | Lifetime redemptions |
| Conversion Rate | Coupon checkout conversion |
| Revenue Generated | Discount campaign revenue |
| Average Discount | Mean discount applied |
| Expiration Countdown | Active campaigns ending soon |

---

# Coupon Analytics Table

| Column | Description |
|--------|-------------|
| Coupon | Code |
| Uses | Redemption count |
| Revenue | Revenue generated |
| Discount Given | Total discount amount |
| Conversion Rate | Percentage |

---

# Campaign Center

Purpose:

Manage promotional campaigns.

---

## Campaign Types

| Campaign | Example |
|----------|---------|
| Launch Campaign | Launch Week |
| Seasonal Sale | Black Friday |
| Regional Promotion | India Discount |
| Creator Promotion | Influencer Code |
| Referral Campaign | Future |

---

# Campaign Workflow

```text
Create Campaign
      │
Add Coupons
      │
Schedule Dates
      │
Campaign Goes Live
      │
Analytics Tracking
```

---

# Scheduled Campaign Table

| Column | Description |
|--------|-------------|
| Campaign | Campaign name |
| Coupon | Coupon code |
| Start Date | Activation |
| End Date | Expiry |
| Status | Scheduled / Active |

---

# Failed Payments Center

Purpose:

Monitor unsuccessful payments.

---

## Failed Payment Table

| Column | Description |
|--------|-------------|
| Attempt ID | Payment attempt |
| Customer | Customer |
| Gateway | Razorpay / Stripe |
| Reason | Failure reason |
| Timestamp | Attempt time |
| Retry | Retry initiated |

---

# Failure Categories

| Category | Description |
|----------|-------------|
| Authentication Failed | Gateway authentication issue |
| Card Declined | Card rejected |
| UPI Cancelled | User cancelled payment |
| Timeout | Payment timeout |
| Verification Failed | Signature mismatch |

---

# Retry Payment Rules

Admin may:

- Send retry email.
- Generate checkout link.
- View failure logs.

Admin cannot manually complete payment.

---

# Refund Center Integration

Payment module integrates with refund module.

Displays:

- Refund status.
- Gateway refund ID.
- Refund timestamp.
- Refund reason.

---

# Revenue Analytics

Revenue charts include:

- Revenue by gateway.
- Revenue by country.
- Revenue by currency.
- Revenue after coupons.
- Revenue after refunds.

---

# Country Revenue Table

| Country | Revenue | Orders |
|--------|---------|--------|
| India | INR Total | Count |
| USA | USD Total | Count |
| UK | GBP Total | Count |
| Europe | EUR Total | Count |

---

# Currency Analytics

Displays:

- INR revenue.
- USD revenue.
- GBP revenue.
- EUR revenue.

Totals remain separated.

---

# Payment Timeline

Events include:

- Checkout started.
- Coupon applied.
- Payment authorized.
- Payment verified.
- Invoice generated.
- Refund completed.

Immutable timeline.

---

# Bulk Payment Actions

| Action | Applies To |
|--------|------------|
| Export Payments | Selected payments |
| Export Revenue Report | Date range |
| Disable Coupon | Coupons |
| Enable Coupon | Coupons |
| Archive Coupon | Expired coupons |

---

# Export Revenue Reports

Supported exports.

| Format | Version 1 |
|--------|-----------|
| CSV | Yes |
| Excel | Yes |
| PDF | Future |

---

# Empty States

Examples.

## No Coupons

"No active coupons created."

## No Failed Payments

"No failed payments detected."

## No Campaigns

"No promotional campaigns scheduled."

---

# Loading States

Skeleton loaders for:

- Payment dashboard.
- Coupon table.
- Revenue analytics.
- PPP pricing table.

---

# Responsive Behavior

## Desktop

Full payment dashboard.

## Tablet

Compact charts and tables.

## Mobile

Cards replace dense tables.

---

# Accessibility Rules

Supports:

- Accessible forms.
- Accessible tables.
- Accessible charts.
- Keyboard navigation.
- Focus indicators.

---

# Performance Targets

| Interaction | Target |
|------------|--------|
| Payment Dashboard Load | Under 800ms |
| Coupon Validation | Under 200ms |
| PPP Update | Under 500ms |
| Revenue Analytics Refresh | Under 1 second |

---

# Database Fields Referenced

## Payments Table

| Field | Purpose |
|------|---------|
| Payment ID | Gateway reference |
| Gateway | Razorpay / Stripe |
| Currency | Purchase currency |
| Amount | Payment value |
| Status | Payment lifecycle |

## Coupons Table

| Field | Purpose |
|------|---------|
| Coupon Code | Primary identifier |
| Discount Type | Fixed / Percentage |
| Discount Value | Discount amount |
| Usage Limit | Validation |
| Expiry Date | Activation window |
| Status | Lifecycle |

---

# Cursor Components

| Component | Used In |
|-----------|---------|
| PaymentTable | Payment center |
| CouponTable | Coupon center |
| PPPPricingTable | PPP management |
| CampaignTable | Campaign center |
| RevenueChart | Dashboard |
| CouponEditorModal | Coupon creation |
| PaymentDetailDrawer | Transaction details |
| GatewayStatusCard | Razorpay / Stripe status |

---

# Cursor Implementation Rules

Cursor must:

1. Separate Razorpay and Stripe dashboards.
2. Build editable PPP pricing table.
3. Build reusable coupon creation workflow.
4. Validate coupons using shared rules.
5. Build campaign scheduling system.
6. Track coupon analytics.
7. Build payment search and filters.
8. Integrate payment module with refunds and orders.

---

# Frozen Decisions (Version 1)

The following Payment & Coupon decisions are locked.

- Razorpay for India.
- Stripe for international payments.
- PPP pricing by region.
- Semantic coupon lifecycle.
- Fixed and percentage coupons.
- Campaign scheduling.
- Automatic coupon validation.
- Separate gateway analytics.
- CSV/Excel revenue exports.

---

# Version History

## Version 1.0

Official FinanceOS Payment & Coupon specification defining payment architecture, Razorpay and Stripe management, PPP pricing administration, coupon lifecycle, campaign management, payment analytics, failed payment handling, revenue reporting, and Cursor implementation standards.

---

**End of Document**

**File:** `05_PAYMENT_AND_COUPON_SYSTEM.md`
