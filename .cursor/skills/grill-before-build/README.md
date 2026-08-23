# Grill Before Build Skill

Version: 1.0
Status: Frozen

## Purpose

This Cursor Skill is part of the permanent FinanceOS engineering workflow.

Its responsibility is to prevent Cursor from implementing workbook features, documentation, formulas, worksheets, dashboards, or engineering logic before completely understanding the requirement.

The skill enforces a mandatory interview ("Grilling Phase") before implementation begins.

## When Cursor Should Use This Skill

Use this skill whenever the user asks to:

- Build a new worksheet.
- Build or modify Excel formulas.
- Create business logic.
- Create dashboards.
- Implement documentation into Excel.
- Create validation systems.
- Build new FinanceOS features.
- Refactor workbook engineering.

## Output

The skill never starts implementation immediately.

It first asks questions, produces an implementation summary, waits for approval, and only then proceeds.