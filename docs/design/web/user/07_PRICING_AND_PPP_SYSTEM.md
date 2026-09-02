# 07_PRICING_AND_PPP_SYSTEM.md

## FinanceOS — Pricing, PPP Localization & Revenue System Specification

**Document ID:** WEB-USER-07

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Pricing & Purchasing Power Parity System)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

**Dependencies:**

- `00_WEB_MASTER.md`
- `01_INFORMATION_ARCHITECTURE.md`
- `02_LANDING_PAGE_SPECIFICATION.md`
- `03_COMPONENT_LIBRARY.md`
- `09_CHECKOUT_AND_DOWNLOAD_FLOW.md`
- `docs/design/00_DESIGN_MASTER.md`

---

# Purpose

This document defines the complete **pricing architecture** for FinanceOS.

It specifies:

- Purchasing Power Parity (PPP) pricing.
- Regional pricing logic.
- Currency localization.
- Checkout pricing display.
- Discount system.
- Coupon system.
- Lifetime purchase policy.
- Future subscription architecture.

This document is the **single source of truth** for pricing across the FinanceOS website.

---

# Pricing Philosophy

FinanceOS follows one pricing principle:

> **Every customer pays a fair price based on their purchasing power while receiving the exact same product.**

The workbook is identical worldwide.

Only the purchase price changes.

---

# Business Model (Version 1)

FinanceOS Version 1 is **one-time purchase**.

### Includes

- Excel Workbook.
- Google Sheets Workbook.
- Dark Theme.
- Light Theme.
- Prediction Engine.
- Reports.
- Future V1 updates.

There is **no subscription** required for the workbook.

---

# Revenue Architecture

FinanceOS has two revenue layers.

| Revenue Type | Version |
|--------------|---------|
| One-Time Purchase | Version 1 |
| Optional Subscription Add-ons | Version 2 |

The website is built to support both.

---

# Primary Product

## FinanceOS Complete Bundle

Every purchase includes everything.

### Bundle Includes

- Excel Edition.
- Google Sheets Edition.
- Prediction Engine.
- Reports.
- Dashboard.
- Goal Planner.
- Investment Tracker.
- Lifetime Version 1 updates.

There are no separate workbook editions.

---

# Pricing Display Philosophy

Visitors should see localized pricing automatically.

Rules:

- Currency symbol changes.
- Price changes.
- Payment gateway changes.
- Product contents remain identical.

---

# PPP Pricing Architecture

FinanceOS uses regional pricing instead of exchange-rate pricing.

## Version 1 Regional Pricing

| Region | Currency | Price |
|--------|----------|-------|
| India | INR | ₹29 |
| United States | USD | $19.99 |
| United Kingdom | GBP | £19.99 |
| Europe | EUR | €19.99 |
| UAE | AED | AED Equivalent |
| Canada | CAD | CAD Equivalent |
| Australia | AUD | AUD Equivalent |
| Singapore | SGD | SGD Equivalent |

Prices are fixed per region.

---

# Region Detection Rules

Pricing is selected using region detection.

### Priority Order

1. User selected country.
2. Browser locale.
3. IP country.
4. Default USD pricing.

Users can manually change region.

---

# Manual Currency Selector

Visitors can override pricing.

### Selector Locations

- Navigation.
- Pricing Section.
- Checkout Page.

Selection persists during session.

---

# Currency Display Rules

Examples:

### India

₹29

### USA

$19.99

### UK

£19.99

### Europe

€19.99

Never show multiple currencies simultaneously.

---

# Pricing Card Structure

Pricing card contains:

### Header

- FinanceOS Complete Bundle.
- One-Time Purchase Badge.

### Price

Localized price.

### Included List

Feature checklist.

### CTA

Buy FinanceOS.

### Trust Row

- Secure Checkout.
- Instant Download.
- Excel Included.
- Google Sheets Included.

---

# Price Breakdown Rules

Checkout shows price transparency.

### Fields

- Product Price.
- Discount.
- Taxes (if applicable).
- Total.

No hidden charges.

---

# Lifetime Purchase Policy

Every purchase includes:

- Lifetime ownership.
- Unlimited downloads.
- Future Version 1 updates.

Version upgrades follow upgrade policy.

---

# Upgrade Policy

## Version 1.x

Free.

Examples:

- V1.1
- V1.2
- V1.3

Customers download newest version.

## Version 2

Paid upgrade.

Existing customers receive upgrade discount.

---

# Discount Philosophy

Discounts are limited.

### Allowed Discounts

- Launch Offer.
- Seasonal Sale.
- Coupon Code.
- Student Coupon (Future).
- Creator Coupon.

No permanent fake discounts.

---

# Launch Pricing Rules

Launch pricing badge.

Examples:

- Early Access.
- Launch Offer.
- Limited-Time Pricing.

Badge disappears after campaign ends.

---

# Coupon Architecture

Version 1 supports coupon codes.

### Coupon Types

| Type | Example |
|------|----------|
| Percentage | 20% OFF |
| Fixed Amount | ₹10 OFF |
| Free Upgrade | V2 Upgrade |
| Referral Discount | Future |

Coupons applied during checkout.

---

# Coupon Validation Rules

Coupons validate:

- Active status.
- Expiry date.
- Region compatibility.
- Minimum purchase.
- Usage limit.

Invalid coupons show error message.

---

# Coupon UI

Checkout contains coupon input.

### States

- Empty.
- Valid.
- Invalid.
- Applied.

Success toast shown after applying.

---

# Regional Discount Rules

Coupons may differ by country.

Example:

India-only coupon.

International coupon.

Global coupon.

Architecture supports region restrictions.

---

# Sale Campaign Architecture

Version 1 supports promotional campaigns.

### Campaign Types

- Launch Week.
- Black Friday.
- New Year.
- Independence Day (India).
- Summer Sale.

Campaign banner controlled globally.

---

# Countdown Timer Rules

Countdown timers allowed only during real promotions.

Never use fake urgency timers.

---

# Pricing Comparison Section

Landing page compares FinanceOS with alternatives.

### Comparison Rows

- Excel Included.
- Google Sheets Included.
- Predictions.
- Unlimited Transactions.
- Goal Planner.
- Investment Tracking.
- Reports.
- One-Time Purchase.

FinanceOS emphasized visually.

---

# Value Communication Rules

Pricing page explains value.

### Messaging Topics

- One purchase.
- Two platforms.
- No subscription.
- Unlimited usage.
- Offline ownership.
- Future V1 updates.

Focus on ownership instead of savings claims.

---

# What's Included Component

Checklist appears in pricing card.

### Included

- Dashboard.
- Transactions.
- Income Tracker.
- Expense Tracker.
- Goals.
- Investments.
- Prediction Engine.
- Reports.
- Themes.
- Mobile Compatible.

Green check icons.

---

# What's Not Included

Transparent communication.

### Not Included

- Mobile App.
- AI Categorization.
- Bank Sync.
- Cloud Backup.

Marked as future features.

---

# Taxes Architecture

Taxes depend on region.

### India

GST handling if required.

### International

Stripe handles regional tax configuration where applicable.

Website always displays final payable amount.

---

# Payment Gateway Mapping

| Region | Gateway |
|--------|---------|
| India | Razorpay |
| International | Stripe |

Checkout automatically selects gateway.

---

# Razorpay Pricing Flow

India checkout.

### Steps

- INR payment.
- UPI.
- Cards.
- Net Banking.
- Wallets.

Instant purchase confirmation.

---

# Stripe Pricing Flow

International checkout.

### Supported Methods

- Credit Card.
- Debit Card.
- Apple Pay (Future).
- Google Pay (Future).

Currency localized.

---

# Checkout Localization Rules

Checkout displays:

- Currency.
- Region.
- Language-ready labels.
- Payment gateway.
- Tax information.

Everything localized.

---

# Purchase Confirmation Rules

Confirmation displays:

- Product purchased.
- Amount paid.
- Currency.
- Order ID.
- Download button.

Email sent simultaneously.

---

# Refund Policy Display

Pricing page includes refund summary.

Links to Refund Policy page.

No hidden refund terms.

---

# Future Subscription Architecture

Version 2 introduces optional subscriptions.

### Subscription Products

- AI Finance Assistant.
- SMS Expense Automation.
- Cloud Backup.
- Multi-device Sync.
- Premium Predictions.

Subscriptions never replace workbook ownership.

---

# Subscription Pricing Placeholder

Future pricing cards reserved.

Labels:

- Coming Soon.
- Premium Add-on.

Not purchasable in Version 1.

---

# Founder Pricing Rules

Internal pricing constants.

### Constants

- Base_USD
- Base_INR
- Base_GBP
- Base_EUR
- Base_AED

Website references constants instead of hardcoded values.

---

# Regional Pricing Object

Architecture stores pricing centrally.

Fields include:

- Region Code.
- Currency.
- Symbol.
- Amount.
- Payment Gateway.

Used across website.

---

# Currency Formatting Rules

Formatting examples.

### INR

₹29

### USD

$19.99

### EUR

€19.99

### GBP

£19.99

No inconsistent decimal formatting.

---

# Pricing CTA Rules

Primary CTA text remains consistent.

Desktop:

**Buy FinanceOS**

Mobile:

**Get FinanceOS**

Checkout:

**Complete Purchase**

No multiple CTA variations.

---

# Trust Indicators Near Pricing

Always display:

- Secure Payment.
- Instant Download.
- Lifetime Access.
- Excel + Google Sheets Included.
- No Subscription Required.

---

# Price Persistence Rules

User-selected region persists during:

- Landing Page.
- Pricing Page.
- Checkout.
- Login.
- Signup.

Stored in browser session.

---

# Pricing Analytics Events

Track pricing interactions.

### Events

- Region Changed.
- Pricing Viewed.
- Coupon Applied.
- Checkout Started.
- Payment Successful.
- Payment Failed.

Used for analytics dashboard.

---

# Responsive Pricing Layout

## Desktop

Centered featured pricing card.

## Tablet

Stacked pricing layout.

## Mobile

Single-column pricing card.

CTA remains sticky.

---

# Accessibility Rules

Pricing supports:

- Screen readers.
- Keyboard navigation.
- Accessible currency selector.
- Accessible coupon input.
- Accessible comparison table.

---

# Cursor Implementation Rules

Cursor must:

1. Create centralized pricing configuration.
2. Implement PPP region detection.
3. Allow manual currency override.
4. Connect pricing to payment gateways.
5. Build reusable pricing card component.
6. Build coupon validation component.
7. Keep pricing synchronized across pages.
8. Prepare architecture for future subscriptions.

---

# Frozen Decisions (Version 1)

The following pricing decisions are locked.

- One-time purchase model.
- PPP pricing architecture.
- Localized currency display.
- Razorpay for India.
- Stripe for international purchases.
- Lifetime Version 1 updates included.
- Coupons supported.
- No fake countdown timers.
- Subscription architecture reserved for Version 2.

---

# Version History

## Version 1.0

Official FinanceOS pricing and PPP system specification defining regional pricing architecture, currency localization, coupon system, checkout pricing behavior, payment gateway mapping, upgrade policy, lifetime purchase policy, future subscription architecture, accessibility, analytics events, and Cursor implementation rules.

---

**End of Document**

**File:** `07_PRICING_AND_PPP_SYSTEM.md`
