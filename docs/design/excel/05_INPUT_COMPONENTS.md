# FinanceOS — Input Components

**Document ID:** DESIGN-EXCEL-05

**Version:** 1.0 (Official V1)

**Status:** Frozen (V1 Input Component Specification)

**Owner:** FinanceOS Architecture

**Repository:** FinanceOS

**Folder:** `/docs/design/excel`

**Dependencies:**
- `00_EXCEL_UI_MASTER.md`
- `01_DASHBOARD_LAYOUT.md`
- `02_WORKSHEET_LAYOUTS.md`
- `03_TABLE_UI_STANDARDS.md`
- `04_CHART_UI_GUIDELINES.md`
- `../00_DESIGN_MASTER.md`
- `../01_DESIGN_SYSTEM.md`
- `../02_COMPONENT_LIBRARY.md`

---

# Purpose

This document defines every interactive input component used inside FinanceOS.

It establishes a **single interaction language** across:

- Microsoft Excel
- Google Sheets
- FinanceOS Website
- FinanceOS Admin Dashboard
- FinanceOS Mobile App (Future)

Every input field, dropdown, slider, toggle, and selector must behave consistently across all platforms.

This document is the **single source of truth** for FinanceOS interactions.

---

# FinanceOS Input Philosophy

FinanceOS is designed to feel like a premium application rather than a traditional spreadsheet.

### Core Principles

- Users should immediately know where to type.
- Calculated cells should never appear editable.
- Inputs should require minimal clicks.
- Every interaction updates the financial model instantly.
- Excel, Google Sheets, Website, and Mobile share identical behavior.

---

# Component Categories

FinanceOS contains six universal input families.

| Component Family | Purpose |
|-----------------|---------|
| Data Entry Inputs | Financial transaction entry |
| Dropdown Selectors | Categories, accounts, currency |
| Interactive Controls | Sliders, toggles, buttons |
| Date Components | Date pickers and month selectors |
| Search & Filter Components | Search boxes and filters |
| System Components | Locked cells, formula cells, badges |

---

# Universal Input States

Every component has one of these states.

| State | Meaning |
|-------|---------|
| Default | Ready for input |
| Active | User currently editing |
| Filled | Contains value |
| Disabled | Not editable |
| Error | Invalid value |
| Success | Validated input |
| Locked | Formula/System controlled |

These states remain identical everywhere.

---

# Editable Cell Standard

Editable cells are visually different from calculated cells.

## Rules

- Soft background.
- Rounded border.
- Visible focus outline.
- Accept keyboard navigation.
- Hover highlight on Website.

Examples:

- Income Amount
- Expense Amount
- Merchant Name
- Notes
- Goal Target

---

# Formula Cell Standard

Formula cells communicate automation.

## Rules

- Locked from editing.
- Slightly muted background.
- Same typography.
- Value selectable but not editable.

Examples:

- Savings Rate
- Net Worth
- Debt Remaining
- Health Score
- Cash Flow Difference

---

# Locked Cell Standard

System-controlled values.

Examples:

- Category IDs
- Currency Rates
- PPP Multipliers
- Internal Lookup Values

Never editable by users.

---

# Primary Input Fields

Used for financial entry.

## Text Input

Used for:

- Merchant
- Description
- Employer
- Investment Name
- Goal Name

Rules:

- Single line.
- Placeholder text.
- Character overflow hidden.
- Expand column, never row height.

---

# Currency Input

Used for:

- Income
- Expenses
- EMI
- Savings
- Investments

Rules:

- Currency symbol automatically displayed.
- Thousand separators.
- Decimal precision follows currency rules.
- Right aligned.

Supported currencies:

- INR
- USD
- GBP
- EUR
- AED

---

# Percentage Input

Used for:

- Interest Rate
- Savings Rate
- Allocation %
- Inflation %
- Investment Return %

Rules:

- Right aligned.
- Percentage formatting automatic.
- Maximum two decimals.

---

# Number Input

Used for:

- Age
- Loan Tenure
- Months
- Dependents
- Emergency Months

Rules:

- Numeric only.
- Validation applied.
- No currency formatting.

---

# Date Components

FinanceOS standardizes every date interaction.

## Transaction Date

Used in:

- Income
- Expenses
- Transfers

Rules:

- Calendar picker.
- DD/MM/YYYY storage.
- Local display format.

---

## Month Selector

Used for dashboard switching.

Displays:

- January
- February
- March
- ...

Rules:

- Dropdown selector.
- Dashboard updates instantly.

---

## Year Selector

Used for annual dashboards.

Rules:

- Dropdown list.
- Dynamic year generation.
- Supports future years.

---

## Custom Date Range Picker

Used for Custom Dashboard.

Inputs:

- Start Date.
- End Date.

Updates all analytics dynamically.

---

# Dropdown Components

FinanceOS dropdowns inherit one visual design.

## Universal Dropdown Rules

- Rounded corners.
- Searchable on Website.
- Arrow indicator.
- Keyboard selectable.
- Mobile picker compatible.

---

# Category Dropdown

Used for:

- Income Categories.
- Expense Categories.
- Goal Categories.

Examples:

Income

- Salary
- Freelance
- Business
- Dividends

Expense

- Food
- Rent
- EMI
- Shopping
- Utilities

---

# Account Dropdown

Used for selecting financial accounts.

Examples:

- HDFC Savings
- SBI Salary
- ICICI Credit Card
- Cash Wallet
- UPI Wallet

Future Website displays bank icons.

---

# Currency Dropdown

Allows workbook currency selection.

Displays:

- INR ₹
- USD $
- GBP £
- EUR €
- AED د.إ

Connected to PPP pricing system.

---

# Payment Method Dropdown

Examples:

- UPI
- Debit Card
- Credit Card
- Cash
- Bank Transfer
- Wallet

Used in transactions.

---

# Goal Category Dropdown

Examples:

- Emergency Fund
- Vacation
- House
- Education
- Vehicle
- Investment

Used inside Goal Tracker.

---

# Loan Type Dropdown

Examples:

- Home Loan
- Car Loan
- Personal Loan
- Student Loan
- Credit Card EMI

Connected to prediction engine.

---

# Investment Type Dropdown

Examples:

- Stocks
- Mutual Funds
- ETFs
- Gold
- Crypto
- Fixed Deposit
- PPF
- EPF

Used in Investments sheet.

---

# Status Dropdowns

Used throughout FinanceOS.

Examples:

- Active
- Completed
- Pending
- Cancelled
- Paid
- Overdue

Status automatically colors badges.

---

# Search Components

Every large table contains search.

## Search Box

Supports:

- Merchant
- Category
- Account
- Institution
- Notes
- Goal
- Loan

Rules:

- Rounded search field.
- Search icon.
- Clear button.

---

# Filter Components

Filters appear beside search.

Supports:

- Date
- Category
- Account
- Currency
- Status
- Payment Method

Dynamic filtering only.

---

# Sort Components

Supported sorting:

- Date
- Amount
- Category
- Highest Spending
- Lowest Spending
- Alphabetical

---

# Slider Components

Sliders are unique to FinanceOS.

Used inside interactive simulator.

---

## Income Slider

Controls monthly income.

Updates:

- Cash Flow.
- Savings.
- Health Score.
- Forecasts.

---

## Expense Slider

Controls monthly expenses.

Updates every prediction instantly.

---

## EMI Slider

Changes EMI amount.

Displays:

- New payoff date.
- Interest saved.
- Cash flow impact.

---

## Savings Slider

Changes monthly savings contribution.

Updates:

- Emergency Fund ETA.
- Savings Growth.
- Retirement Projection.

---

## Inflation Slider

Advanced prediction control.

Used for:

- Retirement.
- Long-term investments.
- Goal forecasting.

---

## Investment Return Slider

Controls expected annual return.

Used for investment prediction engine.

---

# Toggle Components

Binary selections.

Examples:

- Include Bonus.
- Include Side Income.
- Enable Inflation Adjustment.
- Include Existing Savings.
- Enable Future Salary Growth.

Toggles update formulas instantly.

---

# Segmented Controls

Used for switching views.

Examples:

- Monthly / Annual.
- Income / Expense.
- Chart / Table.
- Actual / Forecast.

Website and Mobile use identical controls.

---

# Radio Components

Single-choice financial scenarios.

Examples:

- Rent vs Own.
- SIP Frequency.
- Loan Strategy.

---

# Checkbox Components

Used for planning.

Examples:

- Goal Completed.
- Transaction Verified.
- Include in Budget.
- Recurring Expense.

---

# Multi-Select Components

Used only where multiple selections make sense.

Examples:

- Expense Categories.
- Investment Types.
- Accounts.

Admin dashboard supports searchable multi-select.

---

# Buttons

FinanceOS button hierarchy.

## Primary Button

Purpose:

Main action.

Examples:

- Calculate Prediction.
- Export Report.
- Buy FinanceOS.

---

## Secondary Button

Purpose:

Supporting actions.

Examples:

- Reset.
- Download.
- Import.

---

## Ghost Button

Purpose:

Low priority actions.

Examples:

- Learn More.
- View History.

---

# Import Components

Used for importing statements.

Supports:

- CSV.
- Excel.
- Bank Statement.

Future App supports SMS import.

---

# Export Components

Supports:

- Excel.
- Google Sheets.
- PDF Report.
- CSV.

Same export design everywhere.

---

# Currency Selector (PPP System)

One of FinanceOS's unique features.

Users see localized pricing automatically.

### Supported Regions

- India
- United States
- United Kingdom
- Europe
- UAE
- Canada
- Australia

Rules:

- Display local currency.
- Display localized price.
- Backend validates region.

---

# Validation Components

FinanceOS validates inputs immediately.

Examples:

- Invalid Date.
- Duplicate Account.
- Invalid Interest Rate.
- Empty Required Field.
- Negative Income.

Validation messages remain compact.

---

# Helper Text Rules

Every important input may include helper text.

Example:

> Monthly income after taxes.

> Include only recurring EMI payments.

---

# Placeholder Rules

Placeholders teach users.

Examples:

- Enter salary amount.
- Search merchant.
- Select account.
- Choose category.

Never use lorem ipsum.

---

# Keyboard Navigation Rules

Excel and Website must support:

- Tab navigation.
- Arrow navigation.
- Enter creates next row.
- Escape closes dropdown.

---

# Mobile Interaction Rules

Mobile components become touch friendly.

Requirements:

- Larger dropdowns.
- Larger sliders.
- Sticky action buttons.
- Native date picker.

---

# Accessibility Rules

Inputs support:

- Keyboard access.
- Screen readers.
- High contrast.
- Visible focus states.

---

# Cross Platform Mapping

| Excel | Google Sheets | Website | Admin | Mobile |
|-------|---------------|---------|-------|--------|
| Cell Input | Cell Input | Input Field | Input Field | Native Field |
| Dropdown | Dropdown | Search Dropdown | Search Dropdown | Picker |
| Slider | Slider | Interactive Slider | Interactive Slider | Touch Slider |
| Toggle | Checkbox | Toggle Switch | Toggle Switch | Native Toggle |

Excel remains the visual reference.

---

# Cursor Implementation Rules

Cursor must:

1. Use identical input hierarchy across platforms.
2. Clearly separate editable and formula cells.
3. Auto-propagate dropdown validation through dynamic tables.
4. Preserve keyboard navigation.
5. Keep currency selector connected to PPP architecture.
6. Maintain mobile compatibility.

---

# Frozen Decisions (Version 1)

The following interaction decisions are locked for FinanceOS V1.

- Universal input states.
- Dynamic dropdown propagation.
- Currency selector with PPP support.
- Interactive sliders for simulator.
- Segmented controls for dashboard switching.
- Locked formula cells.
- Shared interaction language across Excel, Sheets, Website, Admin, and Mobile.

---

# Version History

## Version 1.0

Official FinanceOS input component specification defining editable cells, dropdowns, sliders, toggles, search/filter behavior, validation system, currency selector, and cross-platform interaction rules.

---

**End of Document**

**File:** `docs/design/excel/05_INPUT_COMPONENTS.md`
