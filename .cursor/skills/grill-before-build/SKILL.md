# Grill Before Build Skill

Version: 1.0
Status: Frozen
Applies To: FinanceOS Repository

---

# Purpose

This skill prevents Cursor from implementing workbook features before fully understanding the user's intent.

FinanceOS follows Documentation-First Engineering.

Every implementation begins with a mandatory Grilling Phase.

Cursor must interview the user, verify requirements against the FinanceOS documentation, summarize the implementation plan, and wait for approval before generating any Excel workbook content.

This skill exists to eliminate assumptions, hidden architecture changes, incorrect formulas, duplicated logic, and accidental workbook modifications.

---

# When Cursor Must Automatically Use This Skill

Always trigger this skill before implementation when the user asks to:

- Build a worksheet.
- Create or modify Excel formulas.
- Create dashboards.
- Build business logic.
- Add validation.
- Create lookup tables.
- Create named ranges.
- Implement worksheet specifications.
- Build a FinanceOS feature.
- Refactor workbook engineering.
- Modify workbook architecture.
- Create planning logic.
- Create forecasting logic.
- Create transaction behavior.
- Generate an Excel workbook.
- Generate a downloadable `.xlsx` file.

If implementation affects anything inside the `workbook/` folder, this skill is mandatory.

---

# The Mandatory FinanceOS Grilling Phase

Cursor must stop implementation and ask questions first.

Never skip this phase.

## Step 1 — Identify the Target

Cursor identifies:

- Which document is the source of truth?
- Which worksheet is affected?
- Which module is affected?
- Which business entity is involved?

Example output:

- Source Document:
- Worksheet:
- Module:
- Entity:

---

## Step 2 — Requirement Interview

Cursor asks questions until every implementation detail is known.

Questions should include topics like:

### Purpose

- What is this feature supposed to accomplish?
- What user problem does it solve?

### Inputs

- What data will users enter?
- Which tables supply the data?

### Outputs

- What should users see?
- What should be calculated?

### Business Rules

- Required fields.
- Optional fields.
- Validation rules.
- Lookup rules.
- Formula behavior.
- Edge cases.
- Error behavior.

### UI

- Layout.
- Colors.
- Sections.
- Cards.
- Mobile friendliness.
- Protection requirements.

### Excel Compatibility

- Desktop.
- Web.
- Mobile compatibility.

Cursor continues asking until ambiguity is gone.

---

## Step 3 — Cross-Check Documentation

Cursor compares the request against:

- Architecture documents.
- Engineering standards.
- Workbook architecture.
- Worksheet specifications.
- Business rules.
- Transactions model.
- Formula standards.
- Naming conventions.
- Excel compatibility rules.

If anything conflicts:

Stop.

Explain the conflict.

Ask which document should be updated first.

Never resolve conflicts automatically.

---

## Step 4 — Implementation Summary

Before writing code or formulas Cursor produces this summary.

# Implementation Summary

## Documentation Source

- Document(s)

## Workbook Changes

- Worksheets affected.
- Tables affected.
- Named ranges affected.
- Validations affected.
- Formulas affected.
- Conditional formatting affected.
- Protection affected.

## Business Logic

Explain exactly what will happen.

## Risks

Mention possible risks.

## Compatibility

Confirm Desktop, Web, and Mobile compatibility.

---

## Step 5 — Approval Gate

Cursor asks exactly one approval question.

Example:

> I understand the implementation plan. Shall I begin implementing this in the workbook?

Cursor waits.

No workbook generation begins until approval is received.

---

# Output Format During Grilling

Cursor must always use this structure.

## 1. Understanding

Restate the requested feature.

## 2. Questions

Ask only unanswered questions.

## 3. Documentation Check

List relevant documentation.

## 4. Implementation Summary

Summarize planned implementation.

## 5. Approval

Wait.

---

# What Cursor Must Never Do

Never:

- Create workbook formulas immediately.
- Generate `.xlsx` immediately.
- Invent business rules.
- Guess lookup values.
- Create worksheet structure without documentation.
- Modify frozen architecture.
- Rename worksheets.
- Rename IDs.
- Remove tables.
- Change table schemas.
- Create VBA.
- Create Office Scripts.
- Create Power Query.
- Create macros.
- Use unsupported Excel features.

Without explicit approval.

---

# Workbook Generation Rules

When the user asks for an Excel workbook:

Cursor must:

1. Complete the Grilling Phase.
2. Produce an implementation summary.
3. Receive approval.
4. Generate the workbook.
5. Validate workbook compatibility.
6. Explain what was generated.

Never generate the workbook before approval.

---

# Formula Generation Rules

Before generating formulas Cursor must specify:

- Formula purpose.
- Input columns.
- Output column.
- Excel function used.
- Compatibility.
- Error handling.

Only after approval generate formulas.

---

# Dashboard Generation Rules

Before generating dashboards Cursor must specify:

- Cards.
- Metrics.
- Charts.
- Tables.
- Filters.
- Data sources.
- Refresh behavior.

Wait for approval.

---

# Validation Rules

Before generating validation Cursor specifies:

- Source lookup.
- Allowed values.
- Required or optional.
- Error message.
- Input message.

Wait for approval.

---

# Change Impact Rules

Every implementation larger than one worksheet must begin with:

# Impact Summary

## Files Modified

-

## Worksheets Modified

-

## Tables Modified

-

## Named Ranges Modified

-

## Formulas Modified

-

## Documentation Modified

-

Then wait.

---

# Definition of "Approval"

Approval means the user explicitly replies with words like:

- Yes
- Approved
- Continue
- Build it
- Implement it
- Go ahead

Silence is not approval.

---

# Relationship With FinanceOS Rulebook

This skill follows the FinanceOS Cursor Rulebook.

If this skill conflicts with the Rulebook:

The Rulebook wins.

This skill only controls implementation workflow.

---

# Success Criteria

This skill is successful only if Cursor:

- Asks questions before implementation.
- Checks FinanceOS documentation first.
- Produces an implementation summary.
- Waits for approval.
- Implements only documented decisions.
- Generates Excel artifacts only after approval.

---

**End of Skill — Grill Before Build v1.0**