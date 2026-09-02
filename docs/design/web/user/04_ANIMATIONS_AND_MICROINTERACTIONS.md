# 04_ANIMATIONS_AND_MICROINTERACTIONS.md

## FinanceOS — Website Animations & Microinteractions Specification

**Document ID:** WEB-USER-04

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Animations & Microinteractions Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/web/user`

**Dependencies:**

- `00_WEB_MASTER.md`
- `01_INFORMATION_ARCHITECTURE.md`
- `02_LANDING_PAGE_SPECIFICATION.md`
- `03_COMPONENT_LIBRARY.md`
- `docs/design/00_DESIGN_MASTER.md`
- `docs/design/01_DESIGN_SYSTEM.md`

---

# Purpose

This document defines the complete **motion design system** for the FinanceOS website.

Animations in FinanceOS are designed to make the website feel like a **premium SaaS application**, similar to Linear, Stripe, Apple, Arc Browser, Framer, and Lovable.

The website should feel **alive**, but never distracting.

This document is the **single source of truth** for Cursor when implementing animations using **Framer Motion**.

---

# Motion Philosophy

FinanceOS follows one motion principle:

> **Motion should communicate state, hierarchy, and delight — never decoration.**

Animations should make the interface feel responsive and premium.

---

# Animation Principles

FinanceOS animations must follow these rules.

## Core Principles

- Fast.
- Smooth.
- Purposeful.
- Subtle.
- Consistent.

No exaggerated bounce animations.

---

# Animation Categories

Version 1 contains **12 animation systems**.

| Animation Group | Purpose |
|-----------------|---------|
| Page Load Animations | First impression. |
| Scroll Reveal Animations | Section entrances. |
| Hero Animations | Dashboard preview motion. |
| Button Microinteractions | Hover and click feedback. |
| Card Animations | Hover elevation and glow. |
| Chart Animations | Data visualization transitions. |
| Counter Animations | Statistics counting. |
| Navigation Animations | Sticky navbar and mobile menu. |
| Form Animations | Inputs and validation. |
| Modal Animations | Login, signup, checkout. |
| Loading Animations | Skeletons and progress indicators. |
| Success Animations | Purchase completion and downloads. |

---

# Motion Timing System

FinanceOS uses consistent animation timing.

## Duration Tokens

| Token | Duration |
|-------|----------|
| Instant | 100ms |
| Fast | 180ms |
| Normal | 250ms |
| Smooth | 350ms |
| Slow | 500ms |
| Hero | 700ms |

Never exceed 700ms in Version 1.

---

# Easing System

All animations use smooth easing.

## Primary Easing

Ease Out

Used for:

- Cards.
- Buttons.
- Sections.
- Hero.

## Secondary Easing

Ease In-Out

Used for:

- Theme transitions.
- Modal transitions.
- Page transitions.

---

# Page Load Animation

Purpose:

Premium first impression.

### Sequence

1. Background gradient fades in.
2. FinanceOS logo appears.
3. Hero headline fades upward.
4. Description fades upward.
5. CTA buttons appear.
6. Dashboard preview scales into view.
7. Floating KPI cards animate.

Runs once.

---

# Hero Background Animation

Hero background is animated.

### Elements

- Gradient movement.
- Soft radial glow.
- Floating particles.
- Grid opacity shift.

Movement is extremely slow.

No noticeable looping.

---

# Hero Dashboard Entrance

Dashboard preview enters with layered animation.

### Order

1. Dashboard container.
2. KPI cards.
3. Charts.
4. Goal progress.
5. Floating notification cards.

Creates depth.

---

# Floating KPI Card Animation

Cards float around dashboard.

Examples:

- Savings +18%
- Net Worth Increased
- Goal Completed

### Behavior

- Gentle vertical movement.
- Slow opacity pulse.
- Hover pauses animation.

Very subtle.

---

# Scroll Reveal System

Every major section animates when entering viewport.

### Trigger

Once only.

### Reveal Types

- Fade Up.
- Fade Left.
- Fade Right.
- Scale In.

Sections never animate repeatedly.

---

# Stagger Animation

Used for grids.

Examples:

- Feature cards.
- Pricing features.
- Testimonials.
- FAQ categories.

Cards appear sequentially.

---

# Section Header Animation

Components animate in order.

1. Badge.
2. Heading.
3. Description.
4. CTA (if present).

Delay between elements is minimal.

---

# Card Hover Animation

Every premium card has hover feedback.

### Effects

- Lift upward.
- Border glow.
- Shadow increase.
- Gradient highlight.

Applies to:

- Feature Cards.
- KPI Cards.
- Pricing Cards.
- Testimonial Cards.
- Showcase Cards.

---

# Glass Card Glow Animation

Glass components react to hover.

### Behavior

- Blue glow increases.
- Blur deepens.
- Border becomes brighter.

Glow disappears smoothly.

---

# Feature Card Hover Animation

Hover interaction.

### Effects

- Icon rotates slightly.
- Title shifts upward.
- Background gradient brightens.

Used across landing page.

---

# Showcase Screenshot Animation

Screenshots animate into view.

### Entrance

- Fade.
- Scale.
- Slight upward movement.

### Hover

- Zoom 2–3%.
- Shadow increases.
- Cursor becomes interactive.

---

# Screenshot Gallery Animation

Gallery supports smooth scrolling.

### Behavior

- Snap scrolling.
- Hover pause.
- Mobile swipe.

Optional autoplay disabled in Version 1.

---

# Interactive Playground Animation

Purpose:

Feel like a real application.

### Slider Interaction

- Thumb enlarges.
- Track fills smoothly.
- Value counts upward.

Dashboard updates immediately.

---

# Live Dashboard Update Animation

When inputs change:

### Animated Elements

- KPI values count.
- Progress bars animate.
- Charts transition.
- Health score ring updates.

No full page re-render.

---

# Health Score Ring Animation

Ring animates between scores.

### Behavior

- Progress stroke grows.
- Score counts upward.
- Badge color transitions.

Recommendation fades in afterward.

---

# Budget Progress Animation

Progress bars animate width.

Used for:

- Budget usage.
- Goal savings.
- Investment allocation.
- Debt payoff.

---

# Goal Progress Animation

Goal cards animate.

### Behavior

- Progress bar fills.
- Percentage counts.
- ETA updates.

Goal completion badge pops in.

---

# Chart Animation System

FinanceOS charts animate once on load.

### Supported Charts

- Line Charts.
- Area Charts.
- Donut Charts.
- Bar Charts.

Animations remain lightweight.

---

# Line Chart Animation

Behavior

- Line draws left to right.
- Area fades underneath.
- Data points appear.

---

# Donut Chart Animation

Behavior

- Ring sweeps into place.
- Percentage appears afterward.
- Legend fades upward.

---

# Bar Chart Animation

Bars grow upward.

Sequential animation.

---

# Counter Animation System

Used for statistics.

### Examples

- Downloads.
- Customers.
- Countries.
- Savings Amount.
- Net Worth.

Numbers count smoothly.

---

# Statistic Section Animation

Each statistic card animates independently.

Order:

1. Icon.
2. Number.
3. Label.

---

# Pricing Card Animation

Pricing section receives special emphasis.

### Entrance

- Scale.
- Glow.
- Fade.

### Hover

- Border glow.
- CTA pulse.

---

# CTA Button Microinteractions

Primary buttons.

### Hover

- Slight lift.
- Glow.
- Background shift.

### Click

- Press effect.
- Ripple.
- Scale down briefly.

---

# Secondary Button Animation

Hover only.

Border brightens.

Background tint appears.

---

# Icon Button Animation

Hover rotates icon slightly.

Examples:

- Theme toggle.
- Close modal.
- Menu icon.

---

# Navigation Animation

Navbar transitions after scrolling.

### Changes

- Background blur.
- Height reduces.
- Shadow appears.
- CTA stays fixed.

Smooth transition.

---

# Mobile Menu Animation

Drawer slides from right.

### Sequence

1. Overlay fades.
2. Drawer slides.
3. Links stagger.
4. CTA appears last.

---

# Theme Toggle Animation

Switch between themes.

### Transition

- Background color morph.
- Icon rotates.
- Glow transitions.
- Charts recolor smoothly.

---

# FAQ Accordion Animation

Accordion opens smoothly.

### Behavior

- Height expands.
- Chevron rotates.
- Answer fades in.

---

# Form Animation System

Inputs react immediately.

### Focus

- Border glow.
- Label moves upward.
- Placeholder fades.

---

# Validation Animation

### Success

Green check appears.

### Error

Border turns red.

Shake animation once.

---

# Password Strength Animation

Progress bar fills dynamically.

Color transitions:

- Weak
- Medium
- Strong

---

# Modal Animation System

Applies to:

- Login.
- Signup.
- Checkout.
- Success.

### Entrance

- Fade.
- Scale.
- Blur background.

### Exit

Reverse transition.

---

# Checkout Success Animation

Purchase confirmation sequence.

1. Success icon draws.
2. Confetti burst.
3. Download buttons appear.
4. Dashboard CTA fades in.

Only plays once.

---

# Download Button Animation

Hover:

Arrow slides downward.

Click:

Loading spinner replaces icon.

Success:

Checkmark animation.

---

# Toast Notification Animation

Notifications slide from top-right.

### Lifecycle

- Slide In.
- Stay.
- Fade Out.

---

# Loading Skeleton Animation

Used before content loads.

### Behavior

- Shimmer.
- Soft gradient movement.
- Rounded placeholders.

---

# Progress Indicator Animation

Used during:

- Checkout.
- Download preparation.
- Authentication.

Animated linear progress.

---

# Page Transition Animation

Next.js page transitions.

### Transition

- Fade Out.
- Fade In.
- Slight vertical shift.

Keep transitions under 300ms.

---

# Scroll Progress Indicator

Thin progress bar at top.

Displays reading progress on landing page.

Optional hide on dashboard pages.

---

# Cursor Glow Effect

Pointer interaction.

Desktop only.

### Behavior

- Soft blue glow follows cursor.
- Disabled on mobile.
- Disabled with reduced motion.

---

# Background Gradient Motion

Large gradient blobs move slowly.

Applies to:

- Hero.
- Pricing.
- CTA section.

Movement is nearly imperceptible.

---

# Reduced Motion Support

FinanceOS respects accessibility settings.

If reduced motion enabled:

- Disable floating animations.
- Disable particles.
- Disable cursor glow.
- Replace transitions with fades.

Mandatory.

---

# Performance Rules

Animation performance targets.

### Requirements

- GPU accelerated transforms.
- Animate transform and opacity only.
- Avoid layout reflow.
- Avoid expensive filters on scroll.

60 FPS target.

---

# Framer Motion Standards

Cursor must implement animations with Framer Motion.

### Use Framer Motion For

- Section reveals.
- Stagger grids.
- Hero entrance.
- Modals.
- Page transitions.
- Counters.
- Hover states.

Avoid CSS-only complex motion.

---

# Animation Priority Matrix

| Priority | Animation |
|----------|-----------|
| Critical | Hero entrance |
| Critical | Playground updates |
| Critical | Button interactions |
| High | Scroll reveals |
| High | KPI counters |
| High | Chart transitions |
| Medium | Floating cards |
| Medium | Cursor glow |
| Low | Decorative particles |

Performance always overrides decorative motion.

---

# Cursor Implementation Rules

Cursor must:

1. Create reusable animation variants.
2. Use shared timing tokens.
3. Use shared easing tokens.
4. Respect reduced motion.
5. Never animate entire page on every interaction.
6. Keep animations GPU optimized.
7. Keep interactions consistent across all pages.

---

# Frozen Decisions (Version 1)

The following animation decisions are locked.

- Framer Motion is the animation engine.
- Six duration tokens.
- Shared easing system.
- One-time scroll reveals.
- Interactive Playground live animations.
- Premium hover interactions.
- Sticky navbar transitions.
- Reduced motion support.
- GPU-optimized animations only.

---

# Version History

## Version 1.0

Official FinanceOS animation and microinteraction specification defining page transitions, hero animations, hover interactions, chart animations, KPI counters, modals, loading states, checkout success animations, cursor effects, accessibility motion rules, and Framer Motion implementation standards.

---

**End of Document**

**File:** `04_ANIMATIONS_AND_MICROINTERACTIONS.md`
