# FinanceOS — Design System

**Version:** 1.0  
**Status:** Frozen (V1 Design Tokens)  
**Owner:** FinanceOS Architecture  
**Repository:** FinanceOS  
**Folder:** `/design`  
**Dependencies:** `00_DESIGN_MASTER.md`

---

# Purpose

This document defines the **complete visual design language** used across the FinanceOS ecosystem.

Every platform must use the same design tokens, spacing system, typography hierarchy, colors, borders, shadows, gradients, icons, charts, and UI states.

No platform is allowed to introduce its own visual language.

This document is the implementation authority for all visual styling.

---

# Scope

## Included

- Color system.
- Typography system.
- Spacing system.
- Radius system.
- Border system.
- Shadow system.
- Elevation system.
- Gradient system.
- Iconography.
- Chart styling.
- Status colors.
- Interactive states.
- Glassmorphism rules.
- Theme rules.

## Excluded

- Component layouts.
- Excel worksheet layouts.
- Google Sheets layouts.
- Website page layouts.
- Mobile layouts.

Those belong to dedicated implementation documents.

---

# Design Token Philosophy

FinanceOS follows a **Design Token Architecture**.

Every visual property is represented by a reusable token instead of hardcoded values.

Examples:

- Primary Background
- Surface Primary
- Border Default
- Accent Primary
- Success Color
- Heading Large
- Radius Large
- Shadow Medium

Cursor must reference tokens rather than inventing new styles.

---

# Color System

## Theme Architecture

FinanceOS Version 1 is **Dark First**.

A future Light Theme may exist, but V1 ships with a premium dark interface.

---

## Core Palette

### Background Tokens

Defines:

- Primary Background
- Secondary Background
- Elevated Surface
- Card Surface
- Overlay Surface
- Modal Surface

---

### Surface Tokens

Defines:

- Primary Cards
- Secondary Cards
- Interactive Cards
- Analytics Cards
- Prediction Cards

---

### Accent Tokens

Primary Accent Family:

- Electric Blue

Secondary Accent Family:

- Premium Purple

Support Accent:

- Cyan

Highlights:

- Soft Indigo

No additional accent colors are allowed without updating this document.

---

### Neutral Tokens

Defines grayscale hierarchy for:

- Titles
- Body Text
- Labels
- Captions
- Disabled Text
- Placeholder Text
- Dividers

---

# Status Color System

FinanceOS has four permanent status families.

## Success

Represents:

- Healthy finances.
- Completed goals.
- Positive growth.
- Safe recommendations.

---

## Warning

Represents:

- Budget nearing limit.
- Moderate risk.
- Attention required.

---

## Danger

Represents:

- Negative cash flow.
- Unsafe EMI ratio.
- Low emergency runway.
- Critical financial alerts.

---

## Information

Represents:

- Neutral insights.
- Predictions.
- Reports.
- Historical metrics.

---

# Gradient System

Gradients are used sparingly.

Allowed usage:

- Hero backgrounds.
- KPI highlights.
- Prediction cards.
- CTA buttons.
- Premium charts.

Forbidden usage:

- Large tables.
- Transaction rows.
- Input fields.
- Spreadsheet grids.

---

# Typography System

FinanceOS uses one typography hierarchy across all platforms.

## Font Family Rules

Primary Font

Used for:

- Dashboard.
- Website.
- Admin.
- Mobile.

Secondary Font

Used only when displaying numerical KPI emphasis if required.

No decorative fonts.

---

## Typography Hierarchy

Defines permanent levels:

- Display Large
- Display Medium
- Heading XL
- Heading Large
- Heading Medium
- Heading Small
- Body Large
- Body Medium
- Body Small
- Caption
- Label
- KPI Number

Every platform inherits this hierarchy.

---

## Numeric Typography

Financial numbers receive special treatment.

Rules define styling for:

- Currency values.
- Percentages.
- Growth indicators.
- Negative numbers.
- Decimal precision.
- Compact number formatting.

---

# Spacing System

FinanceOS follows an **8-point spacing grid**.

Spacing tokens include:

- XS
- SM
- MD
- LG
- XL
- XXL
- Section Gap
- Dashboard Gap

No arbitrary spacing values.

---

## Layout Rhythm

Defines vertical spacing between:

- Cards.
- Sections.
- Charts.
- Tables.
- Headers.
- Dashboard modules.

Whitespace is part of the design language.

---

# Border System

Defines:

- Default borders.
- Elevated borders.
- Interactive borders.
- Active borders.
- Disabled borders.

Border thickness remains consistent across all platforms.

---

# Radius System

Defines reusable corner radius tokens.

Applies to:

- KPI cards.
- Buttons.
- Inputs.
- Charts.
- Tables.
- Modals.
- Dropdowns.
- Navigation.

Rounded corners communicate the FinanceOS identity.

---

# Shadow & Elevation System

Defines elevation hierarchy.

Levels include:

- None.
- Low.
- Medium.
- High.
- Floating.
- Modal.

Shadows remain soft and minimal.

No heavy drop shadows.

---

# Glassmorphism Rules

Glass effects are limited.

Allowed:

- Hero cards.
- Floating summaries.
- Prediction overlays.

Not allowed:

- Tables.
- Input fields.
- Spreadsheet cells.

Glass is an accent, not a primary surface.

---

# Iconography System

FinanceOS uses a consistent icon language.

Rules include:

- Rounded outline icons.
- Filled icons for KPI states only.
- Financial icons.
- Navigation icons.
- Prediction icons.
- Analytics icons.

Emoji are not part of the product UI.

---

# Illustration Rules

Illustrations are used only for:

- Landing page.
- Empty states.
- Marketing assets.
- Onboarding.

Dashboard interfaces rely on icons and charts instead.

---

# Chart Design System

Defines consistent styling for:

- Line charts.
- Area charts.
- Bar charts.
- Donut charts.
- Pie charts.
- Forecast charts.
- Comparison charts.
- Trend indicators.

Every chart follows identical styling across Excel, Sheets, Web, Admin, and Mobile.

---

# Table Design Rules

Defines table styling philosophy.

Rules include:

- Header hierarchy.
- Alternate row styling.
- Sticky headers.
- Rounded containers.
- Status badges.
- Sorting indicators.
- Empty states.

Tables should maximize readability.

---

# Input Design Rules

Defines styling for:

- Text fields.
- Currency inputs.
- Dropdown menus.
- Toggle switches.
- Sliders.
- Date pickers.
- Search bars.

Interactive elements share the same visual language.

---

# Navigation Design Rules

Defines navigation philosophy.

Includes:

- Sidebar.
- Top navigation.
- Mobile bottom navigation.
- Breadcrumbs.
- Section tabs.
- Active state indicators.

Navigation remains consistent across every platform.

---

# Motion & Animation Rules

FinanceOS uses restrained motion.

Allowed:

- Hover transitions.
- Card elevation.
- Progress animations.
- Chart loading animations.
- Skeleton loading.

Forbidden:

- Bouncing effects.
- Flashing animations.
- Continuous motion.

Motion should communicate feedback, not decoration.

---

# Accessibility Standards

FinanceOS design must support accessibility.

Rules include:

- Contrast ratios.
- Text readability.
- Minimum touch targets.
- Color-independent indicators.
- Keyboard navigation readiness.
- Screen size adaptability.

---

# Dark Theme Standards

Dark mode is the primary experience.

Rules define:

- Surface hierarchy.
- Contrast balance.
- Glow usage.
- Text brightness.
- Chart visibility.

Dark mode should remain comfortable for long financial sessions.

---

# Theme Consistency Rules

Every platform must inherit:

- Same color tokens.
- Same typography hierarchy.
- Same spacing tokens.
- Same border tokens.
- Same radius tokens.
- Same icon language.
- Same status colors.

Platform-specific adaptations cannot violate these rules.

---

# Cursor Implementation Rules

Cursor must follow these rules during implementation.

1. Never hardcode colors when a design token exists.
2. Never invent typography sizes outside the hierarchy.
3. Never use inconsistent spacing.
4. Never create new shadow styles.
5. Never introduce a new gradient family.
6. Every component must inherit this document before implementation.

---

# Dependencies

Parent Document:

- `00_DESIGN_MASTER.md`

Referenced By:

- `02_COMPONENT_LIBRARY.md`
- `03_EXCEL_UI_GUIDELINES.md`
- `04_GSHEETS_UI_GUIDELINES.md`
- `/web`
- `/admin`
- `/app`

---

# Frozen Design Tokens — Version 1

The following systems are frozen for FinanceOS Version 1:

- Dark-first theme.
- Blue/Purple accent family.
- 8-point spacing system.
- Single typography hierarchy.
- Unified status colors.
- Unified elevation hierarchy.
- Unified icon language.
- Unified chart styling philosophy.

Any changes require a Design System version update.

---

# Version History

## Version 1.0

Initial FinanceOS Design System defining all visual design tokens and reusable styling rules shared across Excel, Google Sheets, Website, Admin Dashboard, Mobile Application, and future FinanceOS platforms.

---

**End of Document — `design/01_DESIGN_SYSTEM.md` Version 1.0**
