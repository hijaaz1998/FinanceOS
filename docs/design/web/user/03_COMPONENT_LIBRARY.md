# 03_COMPONENT_LIBRARY.md

## FinanceOS — User Website Component Library

**Document ID:** WEB-USER-03

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Website Component Library)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

**Dependencies:**
- `00_WEB_MASTER.md`
- `01_INFORMATION_ARCHITECTURE.md`
- `02_LANDING_PAGE_SPECIFICATION.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`
- `docs/design/02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines every reusable UI component used across the FinanceOS customer website.

The website must be built as a **component-driven design system**, not individual pages with repeated code.

Every button, card, section, input, modal, badge, pricing card, and navigation element is defined here.

This document becomes the **UI contract** for Cursor and future developers.

---

# Component Philosophy

FinanceOS uses reusable UI blocks.

## Design Principles

- Every component has one responsibility.
- Components are reusable across pages.
- Components inherit global design tokens.
- Components support Light and Dark themes.
- Components are responsive by default.

Never create page-specific duplicate components.

---

# Component Categories

FinanceOS Version 1 contains **11 component groups**.

| Group | Purpose |
|-------|---------|
| Navigation Components | Navbar, Footer, Mobile Menu |
| CTA Components | Buttons, Links, Badges |
| Card Components | KPI Cards, Feature Cards, Showcase Cards |
| Content Components | Section Headers, Lists, Dividers |
| Interactive Components | Inputs, Sliders, Toggles |
| Pricing Components | Pricing Cards, Feature Checklist |
| Social Proof Components | Testimonials, Rating Cards |
| FAQ Components | Accordion System |
| Modal Components | Login, Signup, Checkout Modals |
| Notification Components | Toasts, Alerts, Success Messages |
| Utility Components | Containers, Chips, Loading States |

---

# Global Component Rules

Every component follows FinanceOS design tokens.

## Required Properties

- Border Radius
- Spacing
- Typography
- Shadow
- Hover State
- Focus State
- Disabled State
- Dark Theme
- Light Theme

Cursor must expose variants instead of duplicating components.

---

# Navigation Components

## Primary Navbar

Purpose:

Global navigation for all public pages.

### Contains

- FinanceOS Logo
- Navigation Links
- Theme Toggle
- Login Button
- Buy FinanceOS Button

### Behavior

- Transparent at top.
- Glass effect after scrolling.
- Sticky.
- Responsive.

---

## Mobile Navigation Drawer

Purpose:

Responsive navigation.

### Contains

- Logo
- Menu Links
- CTA Button
- Theme Toggle

Slides from right.

---

## Footer Component

Four-column layout.

### Columns

- Product
- Resources
- Company
- Contact

Shared across every page.

---

# CTA Components

## Primary Button

Purpose:

Highest priority actions.

Examples:

- Buy FinanceOS
- Download Now
- Continue Checkout

### States

- Default
- Hover
- Active
- Loading
- Disabled

Rounded pill style.

---

## Secondary Button

Purpose:

Less important actions.

Examples:

- Try Demo
- Learn More
- View Features

Outlined style.

---

## Ghost Button

Purpose:

Low-emphasis actions.

Examples:

- Login
- Back
- Skip

Transparent background.

---

## Icon Button

Purpose:

Utility interactions.

Examples:

- Theme Toggle
- Menu Toggle
- Close Modal

Circular container.

---

## Link Button

Purpose:

Inline navigation.

Examples:

- Forgot Password
- Privacy Policy
- Terms

Text-only style.

---

# Badge Components

FinanceOS uses badges extensively.

## Product Badge

Examples:

- Excel Included
- Google Sheets Included
- Lifetime Access
- One-Time Purchase

---

## Status Badge

Examples:

- New
- Updated
- Coming Soon
- Best Value

---

## Rating Badge

Displays

- ⭐ 4.9 Rating
- Download Count
- Customer Count

Rounded chip style.

---

# Hero Components

## Hero Dashboard Card

Large dashboard preview shown in Hero.

Contains:

- KPI Cards
- Charts
- Progress Ring
- Navigation Sidebar Preview

Animated floating effect.

---

## Floating KPI Card

Mini floating statistic.

Examples:

- Savings +24%
- Net Worth ₹2.4L
- Emergency Fund 6 Months

Appears around Hero Dashboard.

---

# KPI Card Components

Shared with Excel branding.

## Hero KPI Card

Large premium card.

Displays:

- Icon
- Label
- Value
- Percentage Change

---

## Secondary KPI Card

Compact version.

Used inside dashboard sections.

---

## Progress KPI Card

Displays progress visually.

Examples:

- Goal Progress
- Budget Used
- Investment Allocation

Includes progress bar.

---

# Feature Card Components

Purpose:

Explain FinanceOS features.

### Structure

- Icon
- Title
- Description

Three variants:

- Small
- Medium
- Large

---

## Prediction Feature Card

Dedicated feature card for prediction engine.

Contains:

- Illustration
- Forecast Summary
- CTA

---

# Showcase Components

Purpose:

Display workbook screenshots.

## Screenshot Card

Contains:

- Screenshot
- Window Frame
- Description
- Feature Tags

Hover zoom effect.

---

## Gallery Carousel

Horizontal screenshot gallery.

Supports:

- Desktop
- Mobile swipe
- Auto scroll optional

---

## Comparison Card

Used for Excel vs Google Sheets.

Side-by-side layout.

---

# Interactive Playground Components

Purpose:

Live finance simulator.

## Playground Input Card

Contains:

- Label
- Slider
- Number Input
- Helper Text

---

## Playground Output Card

Contains:

- KPI
- Mini Chart
- Trend Indicator

Updates live.

---

## Health Score Ring

Circular visualization.

Displays:

- Score
- Status
- Recommendation

---

## Budget Utilization Card

Progress visualization.

Displays:

- Used Amount
- Remaining Amount
- Warning Threshold

---

# Pricing Components

Purpose:

Sell FinanceOS.

## Main Pricing Card

Contains:

- PPP Price
- Original Price
- Features Included
- CTA
- Secure Payment Badge

Highlighted card.

---

## Feature Checklist

Checklist component.

Supports:

- Included
- Not Included
- Premium Feature

---

## Region Pricing Chip

Displays localized pricing.

Examples:

- 🇮🇳 ₹29
- 🇺🇸 $19.99
- 🇬🇧 £19.99

---

# Testimonial Components

Purpose:

Social proof.

## Testimonial Card

Contains:

- Avatar
- Name
- Country
- Occupation
- Rating
- Review

---

## Rating Summary Card

Displays:

- Average Rating
- Downloads
- Countries

---

# FAQ Components

## Accordion Component

Contains:

- Question
- Expand Icon
- Answer
- Smooth Animation

Only one expanded at a time.

---

## FAQ Category Tabs

Tabs filter FAQ categories.

---

# Authentication Components

## Login Card

Contains:

- Email Input
- Password Input
- Login Button
- Forgot Password

---

## Signup Card

Contains:

- Name
- Email
- Password
- Confirm Password
- Terms Checkbox
- Signup Button

---

## Password Strength Indicator

Visual progress bar.

Displays:

- Weak
- Medium
- Strong

---

# Checkout Components

## Checkout Summary Card

Contains:

- Product
- Region
- Price
- Tax
- Total

Sticky sidebar.

---

## Payment Method Card

Displays payment providers.

Examples:

- Razorpay
- Stripe

Clickable selection cards.

---

## Success Card

Displayed after purchase.

Contains:

- Success Icon
- Order Summary
- Download CTA

---

# Customer Dashboard Components

## Product Card

Displays purchased FinanceOS version.

Contains:

- Product Image
- Version
- Purchase Date
- Download Button

---

## Download Card

Contains:

- Excel Download
- Google Sheets Copy
- Release Notes

---

## Update Timeline Card

Displays version history.

---

# Notification Components

## Success Toast

Green confirmation.

Examples:

- Payment Successful.
- Download Started.

---

## Error Toast

Red warning.

Examples:

- Payment Failed.
- Invalid Login.

---

## Info Toast

Blue informational notification.

Examples:

- Version Updated.
- Download Available.

---

# Modal Components

## Login Modal

Reusable modal.

---

## Signup Modal

Reusable modal.

---

## Checkout Confirmation Modal

Order confirmation before payment.

---

## Download Ready Modal

Appears after purchase.

---

# Form Components

## Text Input

Shared styling.

Supports:

- Error State
- Success State
- Disabled State

---

## Email Input

Email validation.

---

## Number Input

Currency formatting support.

---

## Slider Component

Used in Playground.

Supports currency labels.

---

## Toggle Switch

Used for:

- Dark Mode
- Notifications (Future)

---

## Checkbox Component

Used for Terms.

---

## Select Dropdown

Used for:

- Country
- Currency
- PPP Region

---

# Content Components

## Section Header

Contains:

- Badge
- Heading
- Description

Used on every section.

---

## Feature List

Bullet checklist with icons.

---

## Divider Component

Gradient divider between sections.

---

## Statistic Grid

Displays four statistics.

Animated counters.

---

# Utility Components

## Container

Maximum widths:

- 640px
- 768px
- 1024px
- 1280px
- 1440px

---

## Glass Card

Premium translucent card.

Used throughout landing page.

---

## Gradient Background

Reusable section background.

Variants:

- Hero
- CTA
- Pricing
- Playground

---

## Chip Component

Small rounded labels.

Examples:

- Budget
- Savings
- Investment
- Prediction

---

## Loading Skeleton

Used while dashboard loads.

Variants:

- Card
- Table
- Chart
- Text

---

## Empty State Card

Used when no purchases exist.

Contains:

- Illustration
- Description
- CTA

---

# Animation Support

Every component supports optional animation.

| Animation | Usage |
|-----------|-------|
| Fade Up | Section entry |
| Scale | Cards |
| Slide | Navigation |
| Counter | Statistics |
| Glow | CTA buttons |
| Float | Hero cards |

Animation document defines timing.

---

# Responsive Component Rules

Every component supports three breakpoints.

| Device | Behavior |
|--------|----------|
| Desktop | Full layout |
| Tablet | Compact grid |
| Mobile | Stacked layout |

No component requires separate mobile implementation.

---

# Accessibility Rules

Every component includes:

- Keyboard navigation.
- Focus ring.
- ARIA labels.
- High contrast support.
- Reduced motion support.

Mandatory.

---

# Component Naming Convention

Cursor must use consistent component names.

Examples:

- `Navbar`
- `HeroDashboard`
- `KpiCard`
- `FeatureCard`
- `PricingCard`
- `TestimonialCard`
- `FaqAccordion`
- `PlaygroundSlider`
- `DownloadCard`
- `GlassCard`

PascalCase only.

---

# Cursor Implementation Rules

Cursor must:

1. Build reusable components before pages.
2. Never duplicate button styles.
3. Use shared spacing tokens.
4. Use shared typography tokens.
5. Use shared semantic colors.
6. Support Dark and Light themes.
7. Support responsive behavior in every component.

---

# Frozen Decisions (Version 1)

The following component decisions are locked.

- Component-driven architecture.
- Shared button system.
- Shared card system.
- Shared badge system.
- Shared authentication forms.
- Shared pricing cards.
- Shared FAQ accordion.
- Shared utility containers.
- Shared responsive behavior.
- PascalCase component naming.

---

# Version History

## Version 1.0

Official FinanceOS website component library defining all reusable UI components, naming conventions, styling rules, responsive behavior, accessibility requirements, and Cursor implementation standards.

---

**End of Document**

**File:** `03_COMPONENT_LIBRARY.md`
