# FinanceOS — User Website Master Specification

**Document ID:** WEB-USER-00

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 User Website Master Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

**Dependencies:**

- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`
- `docs/design/02_COMPONENT_LIBRARY.md`
- `docs/design/excel/00_EXCEL_UI_MASTER.md`
- `docs/design/google-sheets/00_GSHEETS_MASTER.md`
- FinanceOS Architecture Documents (23 Core Docs)

---

# Purpose

This document is the **master specification** for the complete FinanceOS customer-facing website.

The website is **not just a landing page**. It is a complete digital product platform that handles:

- Marketing.
- Interactive product demo.
- PPP-based pricing.
- Authentication.
- Checkout.
- Downloads.
- Customer dashboard.
- Product updates.

Every website document inside `/docs/web/user/` inherits rules from this file.

This document is the **single source of truth** for Cursor when building the FinanceOS website.

---

# FinanceOS Website Philosophy

FinanceOS is positioned as a **premium financial operating system**, not a spreadsheet.

The website should immediately communicate:

> **"This is the most beautiful and powerful personal finance system you've ever used."**

Users should experience FinanceOS before purchasing it.

---

# Version 1 Website Scope

Version 1 website includes:

## Public Experience

- Landing Page.
- Interactive Finance Playground.
- Product Showcase.
- Pricing.
- FAQ.
- About FinanceOS.

## Customer Experience

- Login.
- Signup.
- Checkout.
- Downloads.
- Customer Dashboard.
- Account Settings.

Version 1 does **not** include:

- Community.
- Blog.
- AI Chat Assistant.
- Banking Sync.
- Subscription Dashboard.
- Team Workspaces.

These belong to Version 2 or later.

---

# Website Goals

FinanceOS website has five primary business goals.

| Goal | Purpose |
|-------|---------|
| Convert Visitors | Purchase FinanceOS. |
| Demonstrate Value | Interactive demo before purchase. |
| Build Trust | Showcase features and predictions. |
| Deliver Product | Secure downloads after purchase. |
| Support Customers | Dashboard for updates and downloads. |

Everything on the website supports one of these goals.

---

# Target Audience

Primary audiences:

## Students

- Budget tracking.
- Expense control.
- Savings goals.

## Working Professionals

- Salary planning.
- EMI management.
- Wealth tracking.

## Families

- Shared financial planning.
- Goal tracking.
- Investment management.

## Freelancers & Creators

- Multiple income sources.
- Tax preparation.
- Cash flow management.

Website copy speaks to all four groups.

---

# Product Positioning

FinanceOS is positioned between:

- Notion Finance Templates.
- Etsy Budget Templates.
- Spreadsheet Finance Dashboards.
- Budgeting Apps.

Positioning statement:

> **FinanceOS combines the flexibility of spreadsheets with the experience of a premium finance application.**

---

# Brand Personality

FinanceOS personality is locked.

| Trait | Description |
|--------|-------------|
| Premium | Feels like Apple / Linear / Stripe. |
| Intelligent | Predictive financial insights. |
| Calm | Clean layouts and spacing. |
| Trustworthy | Accurate financial calculations. |
| Modern | SaaS-quality interface. |

Avoid playful or overly colorful design.

---

# Visual Identity

Website inherits FinanceOS Design System.

## Primary Colors

- Midnight Navy.
- Electric Blue.
- Emerald Green.
- Soft Amber.
- Coral Red.

## Neutral Palette

- White.
- Slate.
- Charcoal.
- Soft Gray.

Identical tokens across Excel, Google Sheets, Website, Admin, and Mobile.

---

# Typography System

Typography is shared across platforms.

| Usage | Typography |
|--------|------------|
| Hero Headline | Display XL |
| Section Heading | H1 |
| Card Heading | H2 |
| Feature Title | H3 |
| Body | Body Large |
| Caption | Caption |

Typography never changes between pages.

---

# Website Design Inspiration

FinanceOS Version 1 follows inspiration from:

- Lovable.
- Linear.
- Stripe.
- Framer.
- Arc Browser.
- Premium Etsy product listings.

Design direction:

- Dark-first.
- Glassmorphism accents.
- Soft gradients.
- Rounded containers.
- Smooth animations.

---

# Technology Stack (Frozen)

Cursor must use this stack.

## Frontend

- Next.js 15
- React 19
- TypeScript

## Styling

- Tailwind CSS
- CSS Variables
- Framer Motion

## Icons

- Lucide Icons

## Charts

- Recharts

## State Management

- React Context
- Server Components where appropriate

## Hosting

- Vercel

This stack is frozen for Version 1.

---

# Backend Stack (Version 1)

Backend services.

| Service | Purpose |
|---------|---------|
| Supabase | Authentication + Database |
| Razorpay | India Payments |
| Stripe | International Payments |
| Resend | Email Delivery |
| Vercel Blob / Storage | Download Assets |

Backend documentation created later.

---

# Website Folder Architecture

```text
docs/
└── web/
    └── user/
        ├── 00_WEB_MASTER.md
        ├── 01_INFORMATION_ARCHITECTURE.md
        ├── 02_LANDING_PAGE_SPECIFICATION.md
        ├── 03_COMPONENT_LIBRARY.md
        ├── 04_ANIMATIONS_AND_MICROINTERACTIONS.md
        ├── 05_INTERACTIVE_FINANCE_PLAYGROUND.md
        ├── 06_PRODUCT_SHOWCASE_SECTIONS.md
        ├── 07_PRICING_AND_PPP_SYSTEM.md
        ├── 08_AUTH_AND_USER_ACCOUNTS.md
        ├── 09_CHECKOUT_AND_DOWNLOAD_FLOW.md
        ├── 10_CUSTOMER_DASHBOARD.md
        ├── 11_RESPONSIVE_DESIGN_SYSTEM.md
        ├── 12_SEO_CONTENT_AND_COPY_GUIDELINES.md
        ├── 13_PERFORMANCE_ACCESSIBILITY_SECURITY.md
        └── 14_WEB_IMPLEMENTATION_CHECKLIST.md
```

This structure is frozen.

---

# Website Routing Architecture

## Public Routes

| Route | Purpose |
|--------|---------|
| `/` | Landing Page |
| `/pricing` | Pricing Page |
| `/faq` | Frequently Asked Questions |
| `/about` | About FinanceOS |
| `/privacy` | Privacy Policy |
| `/terms` | Terms & Conditions |
| `/refund-policy` | Refund Policy |

## Customer Routes

| Route | Purpose |
|--------|---------|
| `/login` | Login |
| `/signup` | Signup |
| `/checkout` | Checkout |
| `/downloads` | Downloads |
| `/dashboard` | Customer Dashboard |
| `/account` | Account Settings |

---

# User Journey Architecture

FinanceOS website follows one conversion journey.

## Stage 1 — Discovery

Visitor lands on homepage.

Goals:

- Understand FinanceOS.
- Experience UI.
- View dashboard preview.

---

## Stage 2 — Interaction

Visitor uses Interactive Playground.

Inputs:

- Salary.
- Rent.
- EMI.
- Savings Goal.
- Expenses.

Outputs:

- Cash Flow.
- Savings Rate.
- Health Score.
- Predictions.

---

## Stage 3 — Purchase Decision

Visitor explores:

- Excel screenshots.
- Google Sheets screenshots.
- Prediction engine.
- Reports.
- Pricing.

---

## Stage 4 — Checkout

Localized pricing displayed.

Visitor purchases FinanceOS.

---

## Stage 5 — Product Delivery

User receives:

- Email confirmation.
- Downloads page.
- Customer dashboard.
- Invoice.

---

# Core Website Features

Version 1 features.

## Landing Page

Premium marketing experience.

## Interactive Playground

Live finance simulation.

## Product Showcase

20+ FinanceOS screens.

## Pricing

PPP localization.

## Checkout

Secure payment flow.

## Downloads

Excel + Google Sheets.

## Customer Dashboard

Manage purchases.

---

# Interactive Finance Playground

This is FinanceOS's biggest differentiator.

Users interact before buying.

### Playground Inputs

- Monthly Salary.
- Monthly Expenses.
- EMI.
- Savings Goal.
- Emergency Savings.
- Investment Amount.

### Playground Outputs

- Dashboard Preview.
- Net Worth Card.
- Savings Rate.
- Emergency Runway.
- Budget Utilization.
- Health Score.

No signup required.

---

# Product Showcase Philosophy

FinanceOS behaves like a premium Etsy product listing.

Showcase includes:

- Dashboard.
- Transactions.
- Goals.
- Investments.
- Prediction Engine.
- Reports.
- Dark Theme.
- Light Theme.
- Mobile Preview.
- Google Sheets Preview.

Every major worksheet receives a visual section.

---

# Pricing Philosophy

FinanceOS uses PPP pricing.

| Region | Price |
|--------|-------|
| India | ₹29 |
| United States | $19.99 |
| United Kingdom | £19.99 |
| Europe | €19.99 |
| UAE | AED Equivalent |

Pricing is automatically localized.

---

# Authentication Philosophy

Authentication exists only for purchased customers.

Supports:

- Email Signup.
- Email Login.
- Password Reset.
- Email Verification.
- Purchase Linking.

No social login in Version 1.

---

# Customer Dashboard Philosophy

Dashboard is lightweight.

Contains:

- Purchased Products.
- Download Buttons.
- Version Updates.
- Purchase History.
- Invoice Downloads.
- Account Settings.

Not an admin panel.

---

# Download Philosophy

Users always own their purchase.

Downloads available:

- Excel Workbook.
- Google Sheets Template.
- Documentation Pack (Future).
- Version Updates.

Downloads remain available after purchase.

---

# Mobile-First Strategy

Website is designed desktop-first but fully responsive.

Breakpoints:

| Device | Layout |
|--------|--------|
| Desktop | 12 Columns |
| Tablet | 8 Columns |
| Mobile | 4 Columns |

Interactive Playground works on mobile.

---

# Accessibility Philosophy

Website follows WCAG-inspired accessibility rules.

Requirements:

- Keyboard navigation.
- High contrast.
- Focus indicators.
- Reduced motion support.
- Semantic HTML.
- Screen reader labels.

Accessibility is mandatory.

---

# Performance Targets

| Metric | Target |
|--------|--------|
| Lighthouse Performance | 95+ |
| Accessibility | 100 |
| Best Practices | 100 |
| SEO | 95+ |
| First Contentful Paint | Less than 1.5s |
| Largest Contentful Paint | Less than 2.5s |

Performance is a release requirement.

---

# Security Philosophy

Version 1 security includes:

- HTTPS everywhere.
- Secure authentication.
- Signed download URLs.
- Purchase verification.
- Rate limiting for auth.
- Protected customer routes.

No sensitive financial data stored on landing pages.

---

# SEO Philosophy

FinanceOS website is optimized for organic discovery.

Primary keyword groups:

- Personal Finance Spreadsheet.
- Budget Planner Excel.
- Expense Tracker.
- Google Sheets Finance Template.
- Financial Dashboard Template.
- Wealth Tracker Spreadsheet.

Dedicated SEO document created later.

---

# Analytics Philosophy

Version 1 analytics track:

- Landing Page Views.
- Playground Usage.
- Pricing Clicks.
- Checkout Starts.
- Purchases.
- Download Events.

No invasive tracking.

---

# Internationalization Philosophy

Version 1 supports localization for:

- Currency.
- Pricing.
- Date Formats.
- Financial Year.
- Payment Gateway.

Language localization reserved for Version 2.

---

# Version Boundaries

## Included in Version 1

- Landing Page.
- Interactive Playground.
- Product Showcase.
- Authentication.
- Checkout.
- Customer Dashboard.
- Downloads.
- PPP Pricing.

## Deferred to Version 2

- Blog.
- AI Assistant.
- Subscription Dashboard.
- Banking Connections.
- Referral Program.

## Deferred to Version 3

- Community.
- FinanceOS Cloud Sync.
- AI Insights.
- Mobile Banking Automation.

---

# Cursor Implementation Principles

Cursor must:

1. Build a premium SaaS website matching FinanceOS design tokens.
2. Preserve branding across all pages.
3. Use reusable components.
4. Keep interactive sections client-side.
5. Optimize for desktop and mobile.
6. Preserve accessibility and performance targets.
7. Keep customer dashboard separate from admin dashboard.

---

# Frozen Decisions (Version 1)

The following website decisions are locked.

- Premium dark-first design language.
- Next.js + React + Tailwind stack.
- Interactive Playground before purchase.
- PPP localized pricing.
- Excel + Google Sheets product delivery.
- Customer dashboard after purchase.
- Desktop/tablet/mobile responsive layouts.
- Accessibility-first architecture.
- Offline spreadsheet ownership model.

No Version 2 feature may be introduced into Version 1 without updating this master specification.

---

# Version History

## Version 1.0

Official FinanceOS user website master specification defining platform philosophy, technology stack, routing architecture, user journey, branding, product positioning, interactive playground strategy, authentication philosophy, PPP pricing architecture, customer dashboard scope, performance targets, accessibility, security, and implementation principles.

---

**End of Document**

**File:** `docs/web/user/00_WEB_MASTER.md`
