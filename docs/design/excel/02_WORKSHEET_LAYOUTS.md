# FinanceOS — Worksheet Layout Specifications

**Document ID:** DESIGN-EXCEL-02
**Version:** 1.0
**Status:** Frozen (V1 Worksheet Architecture)
**Owner:** FinanceOS Architecture
**Repository:** FinanceOS
**Folder:** `/docs/design/excel`
**Dependencies:**
- `00_EXCEL_UI_MASTER.md`
- `01_DASHBOARD_LAYOUT.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines the layout architecture for every visible worksheet inside the FinanceOS Excel workbook.

Each worksheet is treated as an individual screen inside the FinanceOS operating system. Every sheet follows a consistent hierarchy, spacing rhythm, navigation experience, and visual language.

This document defines **where information lives**, not how individual components are styled.

---

# Scope

## Included

- Worksheet hierarchy.
- Section ordering.
- Header layouts.
- Summary layouts.
- Navigation placement.
- Card placement.
- Table placement.
- Chart placement.
- Worksheet scrolling behavior.
- Worksheet empty states.

## Excluded

- Table styling.
- Chart styling.
- Conditional formatting.
- Dropdown styling.
- Formula logic.

These are defined in dedicated documents.

---

# Global Worksheet Layout Rules

Every worksheet follows the same page structure.

## Worksheet Hierarchy

1. Page Header.
2. Summary Cards.
3. Primary Content.
4. Charts & Insights.
5. Detailed Tables.
6. Actions / Navigation Footer.

This order is frozen across FinanceOS Version 1.

---

## Common Worksheet Header

Every worksheet begins with a shared header.

### Left Section

- Page Icon.
- Worksheet Name.
- Short Description.

### Right Section

- Current Month.
- Active Currency.
- Last Updated.

Header height remains consistent across workbook.

---

## Summary Card Row

Every worksheet begins with summary cards related to that worksheet.

Examples:

**Income Sheet**

- Total Income.
- Salary.
- Side Income.
- Income Growth.

**Expenses Sheet**

- Total Expenses.
- Essential Expenses.
- Non-Essential Expenses.
- Remaining Budget.

Summary cards always appear before tables.

---

## Section Container Rules

Each worksheet is divided into reusable containers.

Containers include:

- Title.
- Subtitle.
- Content Area.
- Optional Insight Footer.

Containers inherit the Component Library.

---

# Worksheet 01 — Transactions

## Purpose

Primary data entry screen.

Fast transaction management.

---

## Layout Structure

### Hero Header

Transactions overview.

### Summary Cards

- Total Transactions.
- This Month Spending.
- This Month Income.
- Net Cash Flow.

### Filters Row

- Date.
- Category.
- Account.
- Status.
- Search.

### Transaction Entry Section

Quick Add Transaction panel.

### Transactions Table

Primary scrolling section.

### Monthly Insight Footer

Displays monthly totals and spending insight.

---

## User Goal

Users should be able to add a transaction within seconds.

---

# Worksheet 02 — Income

## Purpose

Track every income source.

---

## Layout Structure

### Summary Cards

- Total Income.
- Salary.
- Business Income.
- Side Income.

### Income Sources Section

Income cards grouped by source.

### Monthly Income Trend

Chart container.

### Income Table

Historical income entries.

### Income Insights

Growth comparison.

---

## Notes

Supports multiple recurring income sources.

---

# Worksheet 03 — Expenses

## Purpose

Central spending management worksheet.

---

## Layout Structure

### Summary Cards

- Total Expenses.
- Essential Spending.
- Lifestyle Spending.
- Savings Remaining.

### Budget Overview

Budget allocation cards.

### Expense Categories

Visual category breakdown.

### Monthly Spending Trend

Chart container.

### Expense Table

Detailed expenses.

### Smart Insight Section

Largest spending categories.

---

## Layout Priority

Category insights appear before transaction history.

---

# Worksheet 04 — Assets

## Purpose

Track everything owned.

---

## Layout Structure

### Summary Cards

- Total Assets.
- Liquid Assets.
- Investments.
- Physical Assets.

### Asset Categories

Cards for:

- Cash.
- Bank Accounts.
- Gold.
- Crypto.
- Property.
- Investments.

### Asset Allocation

Chart container.

### Asset Table

Detailed holdings.

### Net Worth Contribution

Insight section.

---

## User Goal

Users understand wealth distribution immediately.

---

# Worksheet 05 — Liabilities

## Purpose

Debt management screen.

---

## Layout Structure

### Summary Cards

- Total Debt.
- Monthly EMI.
- Interest Burden.
- Debt-to-Income Ratio.

### Liability Cards

One card per loan.

### Debt Overview

Chart container.

### EMI Timeline

Progress visualization.

### Liability Table

Loan details.

### Debt Optimization Insights

Avalanche/Snowball recommendation preview.

---

## Priority

Risk appears before historical information.

---

# Worksheet 06 — Goals

## Purpose

Visual financial goals workspace.

---

## Layout Structure

### Summary Cards

- Active Goals.
- Goal Progress.
- Monthly Goal Contribution.
- Completion Forecast.

### Goal Cards

Maximum four highlighted goals.

### Goal Timeline

Forecast visualization.

### Goal Table

Detailed goals.

### Recommendations

Funding recommendations.

---

## User Goal

Feel progress immediately.

---

# Worksheet 07 — Investments

## Purpose

Portfolio overview.

---

## Layout Structure

### Summary Cards

- Total Portfolio.
- Monthly Investment.
- Profit/Loss.
- Allocation Score.

### Investment Categories

Cards by investment type.

### Allocation Visualization

Chart container.

### Investment Table

Holdings.

### Portfolio Insight

Diversification analysis.

---

## Notes

Supports manual investment tracking in V1.

---

# Worksheet 08 — Prediction Engine

## Purpose

FinanceOS intelligence center.

---

## Layout Structure

### Hero Prediction Header

Prediction overview.

### Prediction Cards

- Job Loss Runway.
- EMI Stress Test.
- Savings Forecast.
- Retirement Forecast.
- Goal ETA.

### Scenario Simulator

User inputs.

### Forecast Charts

Prediction visuals.

### Recommendation Section

AI-style decision guidance (rule-based).

---

## Importance

Most premium worksheet after Dashboard.

---

# Worksheet 09 — Reports

## Purpose

Professional report center.

---

## Layout Structure

### Summary Cards

Financial overview.

### Monthly Reports

Cards.

### Annual Reports

Cards.

### Export Section

PDF / Excel / Google Sheets export.

### Report History

Generated reports.

---

## Print Priority

Optimized for exporting.

---

# Worksheet 10 — Settings

## Purpose

FinanceOS configuration center.

---

## Layout Structure

### User Preferences

Currency.

PPP Region.

Financial Year.

### Workbook Preferences

Theme.

Dashboard options.

Categories.

### Export Preferences

Export destination.

Formatting.

### About FinanceOS

Version.

License.

Support.

---

## Settings Organization

Settings grouped into categories instead of long forms.

---

# Worksheet Navigation Footer

Every worksheet ends with navigation shortcuts.

Buttons include:

- Dashboard.
- Previous Section.
- Next Section.

Navigation feels application-like.

---

# Empty State Standards

Every worksheet defines meaningful empty states.

Examples:

Transactions

"Add your first transaction."

Goals

"Create your first savings goal."

Investments

"Add your investment portfolio."

Reports

"Generate your first report."

---

# Worksheet Scrolling Rules

Summary cards remain visible before scrolling into tables.

Large tables freeze headers.

Charts appear before long data sections.

No worksheet begins with a table.

---

# Worksheet Spacing Rules

Every worksheet inherits spacing tokens.

Rules:

- Large spacing between containers.
- Medium spacing between cards.
- Consistent margins.
- Equal card heights where applicable.

---

# Worksheet Visual Rhythm

Every worksheet follows this reading rhythm:

1. Understand.
2. Analyze.
3. Explore.
4. Take Action.

The worksheet never asks users to scroll through raw data before understanding the summary.

---

# Cross Platform Mapping

Every worksheet maps directly to future platforms.

| Excel Worksheet | Future Website | Mobile App |
|----------------|---------------|------------|
| Dashboard | Dashboard | Home |
| Transactions | Transactions | Transactions |
| Income | Income | Income |
| Expenses | Expenses | Expenses |
| Assets | Assets | Wealth |
| Liabilities | Debt | Debt |
| Goals | Goals | Goals |
| Investments | Portfolio | Investments |
| Prediction Engine | Predictions | Predictions |
| Reports | Reports | Reports |
| Settings | Settings | Settings |

This mapping is frozen for Version 1.

---

# Cursor Implementation Rules

1. Every worksheet starts with Page Header.
2. Summary cards always appear before charts.
3. Charts always appear before tables.
4. Tables never appear first.
5. Empty states exist for every worksheet.
6. Navigation footer exists on every worksheet.
7. Worksheet hierarchy must remain identical across Excel and Google Sheets.

---

# Frozen Worksheet Decisions — Version 1

The following worksheet decisions are locked.

- Ten visible worksheets.
- Shared page header.
- Shared summary card section.
- Shared section container layout.
- Shared navigation footer.
- Prediction Engine as dedicated worksheet.
- Reports and Settings as standalone modules.

Future worksheets may be added only through Version 2.

---

# Version History

## Version 1.0

Initial worksheet architecture specification defining the structure, hierarchy, navigation flow, section ordering, and cross-platform mapping for every visible worksheet in the FinanceOS Excel workbook.

---

**End of Document — `docs/design/excel/02_WORKSHEET_LAYOUTS.md`**
