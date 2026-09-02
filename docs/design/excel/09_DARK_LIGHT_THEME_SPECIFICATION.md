# FinanceOS — Dark & Light Theme Specification

**Document ID:** DESIGN-EXCEL-09

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Theme & Appearance Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/excel`

**Dependencies:**
- `00_EXCEL_UI_MASTER.md`
- `01_DASHBOARD_LAYOUT.md`
- `02_WORKSHEET_LAYOUTS.md`
- `03_TABLE_UI_STANDARDS.md`
- `04_CHART_UI_GUIDELINES.md`
- `05_INPUT_COMPONENTS.md`
- `06_KPI_INSIGHT_COMPONENTS.md`
- `07_NAVIGATION_AND_WORKBOOK_ARCHITECTURE.md`
- `08_MOBILE_TABLET_EXCEL_GUIDELINES.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the complete **Light Mode** and **Dark Mode** appearance system for FinanceOS.

It establishes one unified visual identity across:

- Microsoft Excel
- Google Sheets
- FinanceOS Website
- FinanceOS Admin Dashboard
- FinanceOS Mobile App (Future)

Every color, background, border, text style, chart, KPI card, table, and component must inherit this specification.

This document is the **single source of truth** for the FinanceOS appearance system.

---

# Theme Philosophy

FinanceOS supports two premium themes.

## Light Mode

Clean, minimal, professional workspace.

Inspired by:

- Stripe
- Notion Light
- Linear Light
- Apple Finance UI

Best for daytime productivity and spreadsheet work.

---

## Dark Mode

Modern fintech dashboard experience.

Inspired by:

- Arc Browser
- Vercel Dashboard
- Linear Dark
- Raycast
- TradingView Dark

Best for nighttime work, dashboards, and analytics.

---

# Theme Design Principles

Every theme must:

- Feel premium.
- Maintain high readability.
- Preserve identical layout.
- Never change spacing or hierarchy.
- Change colors only.

Switching themes must never affect formulas or workbook structure.

---

# Theme Architecture

FinanceOS has three appearance layers.

## Layer 1 — Foundation Colors

Backgrounds, text, borders.

## Layer 2 — Semantic Colors

Success, warning, danger, info.

## Layer 3 — Component Colors

Cards, tables, charts, buttons, badges.

Every component inherits from these layers.

---

# Theme Switching Rules

FinanceOS supports manual theme switching.

Available themes:

- Light Mode
- Dark Mode

Future Website and Mobile support:

- Follow Device Theme.
- Automatic Theme.

Excel and Google Sheets use manual theme selection.

---

# Primary Color Palette

## Light Mode Foundation

| Element | Color Token |
|---------|-------------|
| Workbook Background | Surface White |
| Card Background | Surface Slate 50 |
| Header Background | Navy 900 |
| Text Primary | Slate 900 |
| Text Secondary | Slate 600 |
| Border | Slate 200 |
| Divider | Slate 100 |

Minimal corporate appearance.

---

## Dark Mode Foundation

| Element | Color Token |
|---------|-------------|
| Workbook Background | Slate 950 |
| Card Background | Slate 900 |
| Header Background | Slate 950 |
| Text Primary | White |
| Text Secondary | Slate 400 |
| Border | Slate 700 |
| Divider | Slate 800 |

Deep matte dashboard appearance.

---

# Semantic Color Tokens

Semantic colors remain identical across themes.

| Token | Purpose |
|-------|----------|
| Success | Income, Savings, Growth |
| Warning | Budget Near Limit |
| Danger | Debt, Overspending |
| Forecast | Predictions |
| Info | Neutral Financial Metrics |
| Accent | Interactive Components |

Never change semantic meaning between themes.

---

# Workbook Background Rules

## Light Mode

- White worksheet surface.
- Soft slate containers.
- Plenty of whitespace.

## Dark Mode

- Charcoal worksheet surface.
- Elevated dark cards.
- Reduced visual glare.

---

# Worksheet Header Theme

Headers remain visually strong.

## Light Mode

Dark navy header with white text.

## Dark Mode

Matte charcoal header with soft white text.

Headers remain identical structurally.

---

# KPI Card Themes

Hero KPI cards adapt automatically.

## Light Mode

- White/Slate cards.
- Dark text.
- Soft borders.

## Dark Mode

- Elevated charcoal cards.
- White values.
- Muted secondary text.

Layout remains identical.

---

# Secondary KPI Cards

Same component.

Only background and border tokens change.

---

# Financial Health Score Theme

Score ring changes background only.

Semantic colors remain unchanged.

- Green
- Amber
- Red
- Blue Forecast

Never invert meanings.

---

# Table Theme Rules

Tables inherit the theme system.

## Light Mode

- White rows.
- Soft zebra rows.
- Slate borders.

## Dark Mode

- Slate rows.
- Slight elevation.
- Dark zebra rows.
- Subtle borders.

---

# Header Row Theme

Header rows remain visually dominant.

Light:

Dark navy.

Dark:

Deep charcoal.

Always sticky.

---

# Editable Cell Theme

Editable cells communicate interaction.

Light:

Soft blue surface.

Dark:

Soft navy surface.

Focus outline uses Accent token.

---

# Formula Cell Theme

Formula cells become muted.

Light:

Slate 100.

Dark:

Slate 800.

Users instantly distinguish automation.

---

# Locked Cell Theme

System cells blend into workbook.

Never attract attention.

---

# Dropdown Theme

Dropdowns inherit workbook appearance.

Light:

White background.

Dark:

Slate 850 background.

Hover and active states use Accent token.

---

# Search Bar Theme

Search component adapts automatically.

Light:

White field with slate border.

Dark:

Slate field with subtle border.

Search icon remains muted.

---

# Button Theme System

## Primary Button

Uses Accent color in both themes.

## Secondary Button

Neutral surface.

## Ghost Button

Transparent background.

Hover adapts by theme.

---

# Toggle Theme

Toggle switches preserve semantic colors.

Light:

Soft gray inactive.

Dark:

Slate inactive.

Active uses Accent.

---

# Slider Theme

Slider tracks adapt.

Light:

Slate track.

Dark:

Charcoal track.

Accent thumb remains identical.

---

# Badge Theme Rules

Badges inherit semantic colors.

Examples:

- Success
- Warning
- Danger
- Forecast
- Neutral

Background opacity changes between themes.

---

# Category Chip Theme

Category chips adapt background brightness.

Semantic identity stays constant.

---

# Progress Bar Theme

Light:

Soft slate background.

Dark:

Slate background.

Progress colors remain semantic.

---

# Navigation Card Theme

Dashboard navigation cards adapt.

Light:

White elevated cards.

Dark:

Slate elevated cards.

Hover state always visible.

---

# Sidebar Theme (Website/Admin)

Reserved for Web.

Light:

White sidebar.

Dark:

Charcoal sidebar.

Accent indicates active page.

---

# Chart Theme System

Charts inherit theme automatically.

## Light Mode

- White chart surface.
- Slate gridlines.
- Dark labels.

## Dark Mode

- Dark surface.
- Muted gridlines.
- White labels.

---

# Gridline Theme

Charts use minimal gridlines.

Light:

Slate 200.

Dark:

Slate 700.

---

# Forecast Theme

Forecast shading adapts.

Light:

Soft blue gradient.

Dark:

Muted blue glow.

Forecast always distinguishable.

---

# Donut Chart Theme

Center value adapts text color.

Slices remain identical semantic colors.

---

# Progress Ring Theme

Ring background changes.

Progress colors remain constant.

---

# Empty State Theme

Empty states adapt backgrounds.

Light:

Slate illustration.

Dark:

Slate glow illustration.

Text always readable.

---

# Insight Card Theme

Insight cards adapt surfaces.

Light:

White card.

Dark:

Slate card.

Priority indicators remain semantic.

---

# Recommendation Card Theme

Recommendations inherit priority colors.

Background opacity changes only.

---

# Report Theme

Reports export in Light Mode only.

Reason:

PDF printing consistency.

Dark Mode reports are preview-only.

---

# Dashboard Theme Preview Rules

Dashboard preview cards on Website inherit selected theme.

Theme preview available before purchase.

---

# Google Sheets Theme Rules

Google Sheets mirrors Excel appearance.

Requirements:

- Dark tables.
- Dark charts.
- Dark KPI cards.
- Light equivalents.

Manual theme switch supported.

---

# Excel Theme Switching

Settings worksheet controls workbook theme.

Theme selector updates:

- Dashboard.
- Tables.
- Charts.
- KPI cards.
- Buttons.
- Navigation.

No formula changes.

---

# Website Theme Switching

Website supports:

- Light
- Dark
- System Theme

Preference remembered.

---

# Admin Dashboard Theme

Admin defaults to Dark Mode.

Light mode available.

Same component tokens.

---

# Mobile Theme Rules

Mobile follows device theme by default.

Manual override available.

---

# Accessibility Rules

Both themes meet readability requirements.

Requirements:

- High contrast.
- Visible focus outlines.
- Color-independent semantic indicators.
- Accessible chart labels.

---

# Theme Transition Rules

Website and Mobile use smooth transitions.

Excel and Google Sheets switch instantly.

---

# Cursor Implementation Rules

Cursor must:

1. Build every component with theme tokens.
2. Never hardcode colors.
3. Keep layout identical between themes.
4. Preserve semantic color meanings.
5. Support manual theme switching.
6. Prepare Website/Admin/Mobile for automatic theme switching.

---

# Frozen Decisions (Version 1)

The following appearance decisions are locked.

- Premium Light Mode.
- Premium Dark Mode.
- Shared semantic colors.
- Theme token architecture.
- Component-level theme inheritance.
- Manual workbook theme switching.
- Cross-platform appearance consistency.

---

# Version History

## Version 1.0

Official FinanceOS appearance specification defining Light Mode, Dark Mode, semantic color system, component theme inheritance, chart adaptation, table adaptation, workbook theme switching, and cross-platform consistency.

---

**End of Document**

**File:** `docs/design/excel/09_DARK_LIGHT_THEME_SPECIFICATION.md`
