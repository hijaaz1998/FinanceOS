# FinanceOS — Known Issues

**Document:** KNOWN_ISSUES  
**Scope:** RC1 QA and later  
**Status:** Living list of deferred defects  
**Date:** 24 September 2026  

This file records known issues that are acknowledged and deferred. It does not change frozen architecture or production formulas.

---

## QA-001 — Excel Web external workbook links

| Field | Value |
| --- | --- |
| ID | **QA-001** |
| Component | QA Validation workbook (`FinanceOS_QA_Validation_v7.xlsx`) |
| Platforms | Excel Web (OneDrive) |
| Status | **Deferred until post-RC1** |

### Description

In Excel Web, Difference Engine cells that should read Baseline / QA-RC1 Business Engine values show **0.00** instead of the live linked amounts (for example B2 / C2 should be 768866).

Excel Desktop on the same files shows the correct linked values and **PASS Count = 95**.

### Root cause

Excel Web stores and/or displays external references as OneDrive URL formulas of the form:

`='https://d.docs.live.net/.../[FinanceOS_QA_Baseline.xlsx]Business Engine'!B4`

Excel Web does not resolve those URL-based external workbook references. Cached zeros remain. Filename-style links (`'[FinanceOS_QA_Baseline.xlsx]Business Engine'!B4`) that Desktop evaluates correctly are rewritten to `d.docs.live.net` URLs when the files live on OneDrive.

This is an Excel Web / OneDrive link-resolution limitation, not a Business Engine calculation defect.

### Impact

- RC1 linked regression cannot be signed off in Excel Web.
- Difference Engine PASS/FAIL in Excel Web is not trustworthy while links return 0.00.
- Product engine sheets (Baseline / QA-RC1 / production) are not implicated by this issue.

### Workaround

Use **Excel Desktop** for the official three-file regression set:

1. `FinanceOS_QA_Baseline.xlsx`
2. `FinanceOS_v1.0-QA-RC1.xlsx`
3. `FinanceOS_QA_Validation_v7.xlsx`

Trust workbook links in Desktop. Do not use Excel Web PASS/FAIL as the RC1 gate.

### Status

**Deferred until post-RC1.**

No further Validation v8/v9 work for this issue during the RC1 checkpoint.

---

## PROD-001 — Excel Desktop Formula2 Save Issue

| Field | Value |
| --- | --- |
| ID | **PROD-001** |
| Component | Production workbook (`FinanceOS_v1.0.xlsx`), Helpers E2:K2 |
| Platforms | Excel Desktop COM on this machine (unactivated / `Formula2` unavailable) |
| Status | **Deferred — environment issue** |

### Description

Helpers E2:K2 dynamic-array formulas (`FILTER` / `SORT` / `UNIQUE`) are removed when the production workbook is saved through the current unactivated Excel Desktop COM environment.

`Formula2` returns runtime error 1004. A COM `SaveCopyAs` in that session blanks E2:K2 and can stamp `fileRecoveryPr repairLoad="1"`.

T002 named-range repair is complete. The remaining Desktop repair line (`Removed Records: Formula from /xl/worksheets/sheet10.xml`) is this environment stripping Helpers spills, not a Dashboard or named-range defect. `/xl/worksheets/sheet10.xml` is Helpers; Dashboard is `sheet13.xml`.

### Root cause

Local Excel Desktop is 16.0 build 14334 with an expired licence (`Product Activation Failed`). That COM session cannot persist dynamic-array formulas. This is not a FinanceOS logic defect.

### Impact

- Workbook logic is unchanged. Helpers E2:K2 FILTER/SORT/UNIQUE formulas remain in the frozen T002 production package.
- Official repair is blocked on this machine. Do not rewrite those formulas as legacy expressions, and do not leave E2:K2 blank.
- Desktop repair dialog / Excel Web “WORKBOOK REPAIRED” can reappear if this COM session saves the file again.

### Workaround

Do not save production through this Excel Desktop COM session.

Repair requires saving once in a licensed Microsoft 365 / Excel 2021+ Desktop environment so Excel can store E2:K2 as native dynamic arrays.

### Status

**Deferred — environment issue.**

T002 is frozen. No Helpers formula rewrite on this machine.
