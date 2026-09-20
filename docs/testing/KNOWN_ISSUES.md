# FinanceOS — Known Issues

**Document:** KNOWN_ISSUES  
**Scope:** RC1 QA and later  
**Status:** Living list of deferred defects  
**Date:** 20 September 2026  

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
