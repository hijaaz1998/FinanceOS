# 11_RESPONSIVE_DESIGN_SYSTEM.md

## FinanceOS — Responsive Design System Specification

**Document ID:** WEB-USER-11

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Responsive Design System)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

---

## Dependencies

- `00_WEB_MASTER.md`
- `02_LANDING_PAGE_SPECIFICATION.md`
- `03_COMPONENT_LIBRARY.md`
- `04_ANIMATIONS_AND_MICROINTERACTIONS.md`
- `/docs/design/00_DESIGN_MASTER.md`
- `/docs/design/01_DESIGN_SYSTEM.md`
- `/docs/design/02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the complete **responsive design system** for the FinanceOS website.

FinanceOS must provide a **consistent premium experience** across:

- Desktop
- Laptop
- Tablet
- Mobile (Android)
- Mobile (iPhone)

The website must look and behave like a native SaaS application on every device.

This document is the **single source of truth** for Cursor when implementing responsiveness.

---

# Responsive Design Philosophy

FinanceOS is designed **mobile-first in architecture**, but **desktop-first in visual richness**.

**Principles**

- Every feature works on every screen size.
- Layout changes without changing functionality.
- Components resize instead of being redesigned.
- No horizontal scrolling anywhere.
- Touch interactions are optimized for mobile devices.

---

# Supported Devices

| Device Category | Width Range |
|-----------------|-------------|
| Small Mobile | 320–374px |
| Standard Mobile | 375–479px |
| Large Mobile | 480–639px |
| Tablet Portrait | 640–767px |
| Tablet Landscape | 768–1023px |
| Laptop | 1024–1279px |
| Desktop | 1280–1535px |
| Large Desktop | 1536px+ |

These breakpoints are frozen for Version 1.

---

# Tailwind Breakpoints

FinanceOS uses Tailwind CSS breakpoints.

| Breakpoint | Width |
|------------|-------|
| `sm` | 640px |
| `md` | 768px |
| `lg` | 1024px |
| `xl` | 1280px |
| `2xl` | 1536px |

No custom breakpoints unless absolutely necessary.

---

# Global Responsive Rules

Every page follows these rules.

- Maximum page width: **1440px**
- Content centered horizontally.
- Minimum side padding always maintained.
- Components stack vertically on smaller screens.
- Typography scales gradually.

---

# Responsive Container System

| Breakpoint | Max Width | Horizontal Padding |
|------------|-----------|--------------------|
| Mobile | 100% | 20px |
| Tablet | 100% | 32px |
| Laptop | 1200px | 40px |
| Desktop | 1320px | 48px |
| Large Desktop | 1440px | 64px |

Containers remain centered.

---

# Responsive Grid System

FinanceOS uses a **12-column grid**.

## Desktop

12 columns.

## Tablet

8 columns.

## Mobile

4 columns.

Every section adapts automatically.

---

# Section Spacing Rules

| Device | Vertical Padding |
|--------|------------------|
| Mobile | 72px |
| Tablet | 88px |
| Desktop | 120px |

Spacing scales consistently.

---

# Typography Scaling

| Element | Mobile | Tablet | Desktop |
|---------|--------|--------|----------|
| Hero Title | 36px | 52px | 64px |
| Section Title | 28px | 36px | 48px |
| Card Title | 20px | 22px | 24px |
| Body | 16px | 17px | 18px |
| Caption | 13px | 14px | 14px |

Typography tokens come from the Design System.

---

# Navigation Responsiveness

## Desktop Navigation

Visible navigation bar.

Items:

- Home
- Features
- Playground
- Pricing
- FAQ
- Login
- Buy FinanceOS

Sticky navbar.

---

## Tablet Navigation

Compact navbar.

Buttons remain visible.

Menu icon appears if space becomes limited.

---

## Mobile Navigation

Hamburger menu.

Contains all navigation items plus CTA.

Slides from the right.

---

# Hero Section Responsiveness

## Desktop

Two-column layout.

- Left: Content.
- Right: Dashboard preview.

---

## Tablet

Content above dashboard.

Dashboard resized.

---

## Mobile

Single-column layout.

Order:

1. Headline
2. Description
3. CTA
4. Dashboard Preview

Dashboard fills width.

---

# Hero Dashboard Scaling

| Device | Behavior |
|--------|----------|
| Desktop | Full interactive preview |
| Tablet | Slightly reduced |
| Mobile | Static preview with reduced floating cards |

Maintains aspect ratio.

---

# KPI Cards Responsiveness

Desktop:

Six cards in two rows.

Tablet:

Three by two grid.

Mobile:

Single-column stack.

---

# Playground Responsiveness

## Desktop

Split application layout.

Inputs left.

Dashboard right.

---

## Tablet

Inputs collapse into accordion.

Dashboard below.

---

## Mobile

Stack order:

1. Salary
2. Expenses
3. Goals
4. Dashboard
5. Predictions

Optimized for thumb interaction.

---

# Slider Responsiveness

Sliders increase touch target.

| Device | Height |
|--------|--------|
| Desktop | 32px |
| Mobile | 44px |

Meets accessibility standards.

---

# Dashboard Preview Responsiveness

Charts resize without distortion.

Rules:

- Preserve aspect ratio.
- Labels never overlap.
- Legends wrap automatically.

---

# Product Showcase Responsiveness

## Desktop

Alternating split layout.

---

## Tablet

Image above text.

---

## Mobile

Vertical card layout.

Carousel used for multiple screenshots.

---

# Screenshot Gallery Responsiveness

Desktop:

Grid gallery.

Tablet:

Two-column gallery.

Mobile:

Swipe carousel.

Lazy loaded images.

---

# Pricing Section Responsiveness

## Desktop

Centered pricing card with comparison table.

---

## Tablet

Stacked comparison.

---

## Mobile

Single pricing card.

Sticky purchase button appears near bottom after scrolling.

---

# FAQ Responsiveness

Accordion width adapts.

Questions remain full width.

Icons stay aligned.

---

# Footer Responsiveness

Desktop:

Four columns.

Tablet:

Two columns.

Mobile:

Single-column stacked footer.

---

# Customer Dashboard Responsiveness

## Desktop

Sidebar + content.

---

## Tablet

Collapsible sidebar drawer.

---

## Mobile

Bottom navigation.

Content becomes cards.

Tables become expandable sections.

---

# Table Responsiveness

Tables never overflow viewport.

### Mobile Strategy

- Horizontal scroll only inside table container.
- Sticky first column where needed.
- Cards replace complex tables when appropriate.

---

# Form Responsiveness

Inputs become full width on mobile.

Buttons stack vertically.

Spacing increases for touch interaction.

---

# Modal Responsiveness

Desktop:

Centered modal.

Tablet:

Smaller centered modal.

Mobile:

Bottom sheet style modal.

---

# Button Responsiveness

| Device | Height |
|--------|--------|
| Desktop | 48px |
| Mobile | 52px |

Buttons span full width on mobile where appropriate.

---

# Card Responsiveness

Cards maintain:

- Border radius.
- Padding.
- Shadows.
- Hover effects.

Hover disabled on touch devices.

---

# Image Responsiveness

Rules:

- Use Next.js Image component.
- Responsive sizes attribute.
- Lazy loading.
- Preserve aspect ratio.
- WebP preferred.

---

# Chart Responsiveness

Charts resize fluidly.

Rules:

- Minimum readable labels.
- Dynamic legend placement.
- Touch-friendly tooltips on mobile.

---

# Responsive Animation Rules

Desktop:

Full animation experience.

Mobile:

Reduced animation intensity.

Tablet:

Medium animation intensity.

---

# Touch Interaction Rules

Touch targets minimum **44×44px**.

Applies to:

- Buttons.
- Icons.
- Sliders.
- Tabs.
- Menu items.

---

# Mobile Safe Area Rules

Support iPhone safe areas.

Applies to:

- Bottom navigation.
- Floating CTA.
- Modals.
- Toast notifications.

---

# Orientation Rules

Landscape mode supported.

Tablet landscape behaves like desktop.

Phone landscape uses compact navigation.

---

# Responsive Utilities

Reusable utility classes.

Examples:

- Responsive containers.
- Responsive spacing.
- Responsive grids.
- Responsive typography.
- Responsive visibility.

Cursor creates utility components instead of repeating classes.

---

# Responsive Testing Matrix

| Screen | Required |
|--------|----------|
| iPhone SE | Yes |
| iPhone 15 Pro | Yes |
| Pixel 8 | Yes |
| Samsung Galaxy S24 | Yes |
| iPad Mini | Yes |
| iPad Pro | Yes |
| MacBook Air | Yes |
| 1440p Desktop | Yes |
| Ultrawide Desktop | Yes |

All screens must be tested.

---

# Accessibility Responsiveness

Responsive layouts must preserve:

- Keyboard navigation.
- Focus order.
- Screen reader hierarchy.
- Zoom up to 200%.
- High contrast support.

---

# Performance Rules

Responsive implementation must:

- Avoid layout shift.
- Use responsive images.
- Use CSS Grid/Flexbox.
- Avoid duplicate mobile/desktop DOM trees where possible.

---

# Cursor Implementation Rules

Cursor must:

1. Build layouts with Tailwind responsive utilities.
2. Follow 12/8/4 grid architecture.
3. Use responsive typography tokens.
4. Convert tables into mobile-friendly layouts.
5. Replace sidebar with bottom navigation on mobile dashboard.
6. Preserve accessibility across breakpoints.
7. Optimize images and charts responsively.
8. Test every major page against the responsive testing matrix.

---

# Frozen Decisions (Version 1)

The following responsive design decisions are locked.

- Tailwind breakpoint system.
- 12/8/4 responsive grid.
- Mobile-first responsive architecture.
- Sticky desktop navigation.
- Bottom navigation for customer dashboard mobile.
- Carousel galleries on mobile.
- Full-width mobile forms.
- 44px minimum touch targets.
- Responsive image optimization.
- Responsive chart scaling.

---

# Version History

## Version 1.0

Official FinanceOS responsive design specification defining breakpoints, grid system, typography scaling, navigation behavior, dashboard responsiveness, gallery responsiveness, table strategy, mobile interactions, accessibility, testing matrix, performance rules, and Cursor implementation standards.

---

**End of Document**

**File:** `11_RESPONSIVE_DESIGN_SYSTEM.md`
