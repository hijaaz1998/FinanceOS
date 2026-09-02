# 01_INFORMATION_ARCHITECTURE.md

## FinanceOS — User Website Information Architecture

**Document ID:** WEB-USER-01

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Website Information Architecture)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

**Dependencies:**

- `00_WEB_MASTER.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`
- `docs/design/02_COMPONENT_LIBRARY.md`
- `docs/design/excel/00_EXCEL_UI_MASTER.md`
- `docs/design/google-sheets/00_GSHEETS_MASTER.md`

---

# Purpose

This document defines the complete **information architecture** of the FinanceOS customer-facing website.

It specifies:

- Website sitemap.
- Navigation hierarchy.
- Page relationships.
- User journeys.
- Routing conventions.
- Content hierarchy.
- CTA flow.
- Internal linking structure.

This document is the **single source of truth** for how users navigate FinanceOS.

---

# FinanceOS Website Architecture Philosophy

FinanceOS is designed as a **premium SaaS website** with an embedded digital product experience.

The architecture has one objective:

> Guide a visitor from curiosity → interaction → trust → purchase → download → long-term customer.

Every page has one primary goal.

---

# Website Architecture Overview

The FinanceOS website consists of **three experience layers**.

| Layer | Purpose |
|-------|---------|
| Marketing Layer | Convince visitors to buy FinanceOS. |
| Commerce Layer | Pricing, checkout, authentication, downloads. |
| Customer Layer | Purchased products and account management. |

These layers remain completely separated.

---

# Complete Website Sitemap

```text
FinanceOS Website
│
├── Landing Page (/)
│   ├── Hero
│   ├── Trusted By
│   ├── Interactive Playground
│   ├── Product Showcase
│   ├── Prediction Engine
│   ├── Excel + Google Sheets
│   ├── Testimonials
│   ├── Pricing Preview
│   ├── FAQ Preview
│   └── Footer
│
├── Pricing (/pricing)
│
├── About (/about)
│
├── FAQ (/faq)
│
├── Login (/login)
│
├── Signup (/signup)
│
├── Checkout (/checkout)
│
├── Downloads (/downloads)
│
├── Dashboard (/dashboard)
│
├── Account (/account)
│
├── Privacy (/privacy)
│
├── Terms (/terms)
│
└── Refund Policy (/refund-policy)
```

This sitemap is frozen for Version 1.

---

# Primary Navigation Structure

The top navigation appears on every public page.

## Desktop Navigation

| Navigation Item | Destination |
|-----------------|-------------|
| Home | Landing Page |
| Features | Landing Page Section |
| Playground | Interactive Playground |
| Pricing | Pricing Page |
| FAQ | FAQ Page |
| Login | Login Page |
| Buy FinanceOS | Checkout Page |

Navigation remains sticky.

---

# Mobile Navigation Structure

Mobile navigation uses a slide-out menu.

### Menu Items

- Home
- Features
- Playground
- Pricing
- FAQ
- Login
- Buy FinanceOS

Primary CTA always remains visible.

---

# Footer Navigation Structure

Footer is divided into four columns.

## Product

- Features
- Pricing
- Downloads
- Updates

## Resources

- FAQ
- Documentation
- Changelog (Future)
- Support

## Company

- About FinanceOS
- Privacy Policy
- Terms
- Refund Policy

## Contact

- Support Email
- Instagram (Future)
- X / Twitter (Future)
- LinkedIn (Future)

Footer appears globally.

---

# Landing Page Information Hierarchy

The landing page is designed as a storytelling experience.

## Section Order

1. Hero
2. Social Proof
3. Interactive Playground
4. Product Showcase
5. Prediction Engine
6. Excel + Google Sheets
7. Why FinanceOS
8. Testimonials
9. Pricing
10. FAQ
11. Final CTA
12. Footer

No additional sections above Hero.

---

# Hero Section Architecture

Purpose:

Capture attention within five seconds.

### Hero Contains

- Main headline.
- Supporting headline.
- Primary CTA.
- Secondary CTA.
- Live FinanceOS dashboard preview.
- Background gradient animation.

Primary CTA appears above the fold.

---

# Trusted By Section

Purpose:

Build immediate credibility.

### Displays

- Number of downloads.
- Average rating.
- Countries using FinanceOS.
- Excel + Google Sheets badges.

No fake company logos.

---

# Interactive Playground Architecture

Purpose:

Let visitors experience FinanceOS before purchase.

### Contains

- Salary input.
- Expense sliders.
- Savings goal.
- EMI input.
- Emergency savings input.
- Live dashboard preview.
- Health score preview.
- Prediction preview.

CTA follows playground results.

---

# Product Showcase Architecture

Purpose:

Explain everything included in FinanceOS.

### Showcase Order

1. Dashboard
2. Transactions
3. Income
4. Expenses
5. Goals
6. Investments
7. Prediction Engine
8. Reports
9. Dark Theme
10. Google Sheets Edition

Inspired by premium Etsy listings.

---

# Prediction Engine Showcase

Purpose:

Highlight FinanceOS differentiator.

### Showcase Cards

- Emergency Runway.
- Retirement Forecast.
- EMI Simulator.
- Savings Forecast.
- Scenario Simulator.

Each card links visually to workbook screenshots.

---

# Excel + Google Sheets Section

Purpose:

Explain both versions included.

### Displays

- Excel UI preview.
- Google Sheets UI preview.
- Feature parity comparison.
- Download badges.

No pricing shown here.

---

# Why FinanceOS Section

Purpose:

Explain benefits instead of features.

### Benefit Cards

- Control Every Rupee.
- Predict Your Future.
- Track Every Investment.
- Reach Goals Faster.
- Beautiful Financial Dashboard.
- Excel + Google Sheets Included.

Six cards in a responsive grid.

---

# Testimonials Architecture

Purpose:

Build trust before pricing.

### Card Structure

- Profile image.
- Name.
- Occupation.
- Review.
- Rating.

Version 1 supports static testimonials.

---

# Pricing Architecture

Purpose:

Convert visitors.

### Pricing Layout

- PPP pricing card.
- What's included.
- One-time purchase badge.
- Secure checkout badges.
- Download immediately.

Only one primary plan in Version 1.

---

# FAQ Architecture

Purpose:

Remove purchase objections.

### FAQ Categories

- Product.
- Compatibility.
- Payments.
- Downloads.
- Refunds.
- Updates.

Accordion layout.

---

# Final CTA Architecture

Purpose:

Capture users who scrolled entire page.

### Contains

- Strong headline.
- Purchase CTA.
- Money-back policy.
- Excel + Google Sheets badge.

Large full-width section.

---

# Public Page Hierarchy

## Home

Primary conversion page.

## Pricing

Dedicated pricing explanation.

## FAQ

Detailed support.

## About

FinanceOS story.

No duplicate content across pages.

---

# Pricing Page Architecture

Purpose:

Answer pricing questions.

### Sections

- PPP explanation.
- Region pricing.
- Included products.
- Lifetime updates policy.
- FAQ.
- Checkout CTA.

---

# About Page Architecture

Purpose:

Tell FinanceOS story.

### Sections

- Mission.
- Why FinanceOS.
- Design Philosophy.
- Product Vision.
- Roadmap Preview.

No founder biography in Version 1.

---

# FAQ Page Architecture

Purpose:

Searchable support content.

### Categories

- Purchasing.
- Excel.
- Google Sheets.
- Predictions.
- Refund Policy.
- Technical Support.

Future search functionality reserved.

---

# Authentication Flow Architecture

Public users become customers through authentication.

### Flow

Landing Page

↓

Checkout

↓

Signup/Login

↓

Purchase Verification

↓

Customer Dashboard

Authentication happens after purchase begins.

---

# Login Page Architecture

Contains:

- Email.
- Password.
- Forgot Password.
- Login Button.
- Signup Link.

Minimal interface.

---

# Signup Page Architecture

Contains:

- Name.
- Email.
- Password.
- Confirm Password.
- Terms Checkbox.
- Create Account Button.

Email verification required.

---

# Checkout Flow Architecture

User journey.

Landing Page

↓

Pricing

↓

Checkout

↓

Payment Gateway

↓

Success Page

↓

Dashboard

↓

Downloads

Single uninterrupted flow.

---

# Checkout Success Page

Purpose:

Celebrate purchase.

### Displays

- Success animation.
- Purchase confirmation.
- Download buttons.
- Dashboard button.
- Email confirmation notice.

---

# Customer Dashboard Architecture

Purpose:

Manage purchased products.

### Sections

- Purchased Products.
- Download Center.
- Product Updates.
- Invoices.
- Account Information.

Separate from landing pages.

---

# Download Center Architecture

Downloads page contains:

- Excel Download.
- Google Sheets Copy.
- Version Number.
- Release Date.
- Installation Guide.
- Update History.

Users always access latest eligible version.

---

# Account Page Architecture

Contains:

### Personal Information

- Name.
- Email.
- Country.

### Purchase Information

- Order ID.
- Purchase Date.
- Product Version.

### Security

- Change Password.
- Logout.

---

# Error Page Architecture

Version 1 custom pages.

## 404

- Friendly illustration.
- Return Home CTA.

## Payment Failed

- Retry Payment.
- Contact Support.

## Download Expired

- Refresh Download Link.
- Login CTA.

---

# Navigation State Rules

Navigation highlights active page.

Examples:

- Home active.
- Pricing active.
- FAQ active.
- Dashboard active.

Supports desktop and mobile.

---

# CTA Hierarchy

FinanceOS has one CTA priority system.

| Priority | CTA |
|----------|-----|
| Primary | Buy FinanceOS |
| Secondary | Try Interactive Demo |
| Tertiary | View Features |
| Utility | Login |

Every page follows this hierarchy.

---

# Internal Linking Rules

Landing page links internally to sections.

Examples:

- Hero → Pricing.
- Playground → Pricing.
- Showcase → Features.
- FAQ Preview → FAQ Page.
- Footer → Policies.

Improves navigation and SEO.

---

# Scroll Journey Architecture

Visitor scroll experience.

1. Curiosity.
2. Value.
3. Interaction.
4. Trust.
5. Features.
6. Pricing.
7. Purchase.

Content order never changes.

---

# Breadcrumb Rules

Customer pages include breadcrumbs.

Example:

Dashboard → Downloads

Dashboard → Account

Public pages do not require breadcrumbs.

---

# Search Architecture (Future)

Version 1 search scope.

Supports:

- FAQ Search.
- Documentation Search.

Deferred to Version 2.

---

# Responsive Navigation Rules

## Desktop

Sticky navbar.

## Tablet

Compact navbar.

## Mobile

Hamburger menu.

CTA always visible.

---

# Accessibility Navigation Rules

Requirements:

- Keyboard accessible.
- Focus states.
- Skip to content link.
- Screen reader labels.
- Accessible menu toggle.

Mandatory for Version 1.

---

# SEO URL Rules

URLs remain short and readable.

Examples:

- `/pricing`
- `/faq`
- `/dashboard`
- `/downloads`

Avoid nested URLs unless necessary.

---

# Cursor Routing Rules

Cursor must implement:

1. Public layout.
2. Customer layout.
3. Shared navigation component.
4. Shared footer component.
5. Route protection for customer pages.
6. Sticky navigation behavior.
7. Mobile navigation drawer.

---

# Frozen Decisions (Version 1)

The following architecture decisions are locked.

- Three-layer website architecture.
- Public/customer page separation.
- Landing page storytelling structure.
- Sticky navigation.
- Footer with four columns.
- One primary pricing plan.
- Interactive Playground before purchase.
- Customer dashboard after purchase.
- Protected customer routes.
- CTA hierarchy.

---

# Version History

## Version 1.0

Official FinanceOS website information architecture defining sitemap, navigation hierarchy, routing conventions, landing page storytelling flow, authentication journey, checkout flow, customer dashboard structure, footer architecture, CTA hierarchy, responsive navigation, and internal linking rules.

---

**End of Document**

**File:** `01_INFORMATION_ARCHITECTURE.md`
