# FinanceOS Version 1.0 RC1 — QA Environment Report

**Document:** QA_REPORT_RC1  
**Setup date:** 19 September 2026  
**Mode:** Testing only. Not a production release.

> **Checkpoint:** Official RC1 validation workbook is `workbook/testing/FinanceOS_QA_Validation_v7.xlsx` (Frozen). See `docs/testing/QA-VALIDATION-RC1.md` and `docs/testing/KNOWN_ISSUES.md` (QA-001). This report is the original environment-setup note; paths below that still mention v1 are historical.

Production workbook and Git history were not modified.

---

## Success checklist

| Criterion | Result |
| --- | --- |
| Sample dataset generated | Yes — 141 transactions (range 120–150) |
| Business Engine populated from tables | Yes for income/expense/savings/assets/liabilities/goals that SUMIFS/COUNTIFS can see. Account-type totals stay `0` (literal formulas on this freeze). |
| Analysis Engine formulas intact | Yes — 309 formulas, sheet XML not edited |
| QA Validation workbook linked | Yes — Baseline vs QA-RC1 workbook links (430 `[*.xlsx]` formula tokens) |
| Baseline frozen identical to QA-RC1 start | Yes — same SHA |
| QA-RC1 editable | Yes — structure protection removed; worksheet protection unchanged |
| Business Engine visible in testing copies | Yes |
| Analysis Engine visible in testing copies | Yes |
| Production workbook untouched | Yes |
| Git untouched | Yes — no commit, no branch change |
| Designed for three Excel Web tabs | Yes |

**Promotion recommendation:** Do not promote production. This package is the RC1 regression environment for manual Excel Web testing.

---

## Files

| Role | Path | SHA256 |
| --- | --- | --- |
| Production (never edited) | `workbook/FinanceOS_v1.0.xlsx` | `D7F50CAA3D3CF6A6E7A57EA1147A754DF2F7E5F9E1C0C9FD88D44C6E5C22E262` |
| RC1 frozen archive (never edited) | `workbook/versions/FinanceOS_v1.0-RC1-FROZEN.xlsx` | `D7F50CAA3D3CF6A6E7A57EA1147A754DF2F7E5F9E1C0C9FD88D44C6E5C22E262` |
| QA Baseline (frozen after dataset) | `workbook/testing/FinanceOS_QA_Baseline.xlsx` | `1273399C1DC7FC276C0AC4CC9F529DAA8D6462A3B32960F5FF5C18EA7B8FF4BF` |
| QA-RC1 (edit this during scenarios) | `workbook/testing/FinanceOS_v1.0-QA-RC1.xlsx` | `1273399C1DC7FC276C0AC4CC9F529DAA8D6462A3B32960F5FF5C18EA7B8FF4BF` |
| QA Validation dashboard | `workbook/testing/FinanceOS_QA_Validation_v1.xlsx` | `09E005A01F3809796B89D2B2F3730685825FDCC33DD3111DA9FE8A9D1C5354D2` |

Baseline and QA-RC1 are byte-identical at SCN-BASE start.

---

## Excel Web session (required)

Open **three tabs in the same browser window**, same Microsoft account, same `workbook/testing/` folder:

1. `FinanceOS_QA_Baseline.xlsx` — do not edit  
2. `FinanceOS_v1.0-QA-RC1.xlsx` — run every scenario here  
3. `FinanceOS_QA_Validation_v1.xlsx` — linked dashboard  

Click **Trust workbook links** once so Difference Engine can read Baseline and QA-RC1. That prompt is expected. It is not a production-engine defect.

---

## QA-only workbook.xml changes (testing copies)

Applied to Baseline and QA-RC1 only (copied from production, then patched):

- Removed `<workbookProtection lockStructure="1"/>`
- `Business Engine` visible
- `Analysis Engine` visible
- `Helpers` remains hidden

Worksheet protection on data-entry sheets is unchanged. Cells were not unlocked. Passwords were not changed. Business Engine / Analysis Engine formulas were not changed (`sheet11` still has 49 formulas; `sheet12` still has 309).

`Business Engine` B1 value set to **12-Sep-2026** (Excel serial `46277`). That is an as-of **value**, not a formula edit.

---

## Sample dataset (QA-RC1 = Baseline)

| Entity | Count |
| --- | --- |
| Settings | 7 |
| Categories | 16 |
| Accounts | 6 (HDFC Salary, SBI Savings, Axis Savings, ICICI Credit Card, Cash Wallet, Emergency Cash) |
| Income sources | 4 (Acme Payroll, Freelance Gigs, HDFC Cashback, FD Interest) |
| Assets | 4 (Gold, Laptop, Mutual Fund, Emergency Cash Reserve) |
| Liabilities | 3 (Personal Loan, Bike EMI, Credit Card EMI) |
| Recurring commitments | 10 |
| Goals | 5 |
| Transactions | **141** |

As-of date: **12-Sep-2026**. Date range: January 2026 → October 2026 (one future pending salary).

BUG-003 fixture (row order, not ID order):

- Row 2 = `TXN-000090` date **30-Sep-2026** (serial 46295)  
- Row 3 = `TXN-000010` date **01-Jan-2026** (serial 46023)  

Also included: inbound/outbound transfers, pending latest, cancelled latest, reconciled, duplicate same-day amounts, small (19 / 25), large bonus (50,000), future pending.

`tblAccounts` on this freeze has no **Include in Dashboard** column. That field was not added.

Appreciation / Remaining Amount table formulas were left in place (not overwritten).

---

## Formula counts

| Sheet | Formulas |
| --- | --- |
| Business Engine (`sheet11.xml`) | 49 |
| Analysis Engine (`sheet12.xml`) | 309 |
| MAXIFS in Business Engine | 0 |

---

## Validation workbook

95 live metrics: 50 Business Engine outputs + 45 Analysis Engine outputs.

Links use:

- `[FinanceOS_QA_Baseline.xlsx]…`
- `[FinanceOS_v1.0-QA-RC1.xlsx]…`

`externalLinks` XML parts = **0** in the package until Excel Web/Desktop materializes them after Trust. That is normal for formula-style links.

Scenarios: SCN-BASE, SCN-A … SCN-P (17).

---

## Known blockers (RC1 engine-foundation freeze)

These are production-freeze facts. They are **not** fixed in QA copies.

1. **Account summary B4, B6–B9, B49 are literal `0`.** There is no Account Engine matrix on this RC1. Account balances will not appear in those cells. H2 / I2 last-transaction-date cells do not exist.
2. **SCN-K/L/M cannot observe last-transaction-date** on Business Engine until Account Engine exists.
3. **Income/expense SUMIFS do not filter Transaction Status.** Pending/Cancelled rows may still change B12/B16/B22. SCN-D/E should be scored against that actual formula behavior.
4. **Goal Current Saved Amount is a stored table value**, not a roll-up from goal-contribution transactions.
5. **Excel Web will ask to trust workbook links.** Required for automatic Baseline vs QA-RC1 compare. Compatibility popup on the **engine** files should still be absent (same formulas as production). The validation file uses IF / COUNTIF / FORMULATEXT / NOW only.

---

## How to run SCN-BASE

1. Open the three files as Excel Web tabs.  
2. Trust workbook links.  
3. Set Active Scenario = `SCN-BASE`.  
4. Difference Engine should be PASS (difference ≈ 0) after calculate. WAIT means a link did not resolve — stay in the same folder / same account and retry Trust.  
5. Then execute SCN-A … SCN-P only on the QA-RC1 tab. Rollback by restoring QA-RC1 from Baseline (copy file).

---

## Coverage

| Section | Status |
| --- | --- |
| Income, Expense, Savings, Health, As-Of, Analysis Engine | STRESSED |
| Assets, Liabilities, Goals, Account totals | BASELINE ONLY / engine-limited |
| Last Transaction Date / H2 / I2 | N/A on this RC1 freeze |

---

## Git

No commit was created. `HEAD` remains `db39c2e` (checkpoint-001). Production path `workbook/FinanceOS_v1.0.xlsx` was not written.
