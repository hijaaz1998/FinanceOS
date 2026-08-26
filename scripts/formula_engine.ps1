# FinanceOS Formula Engine
# Version: 1.0
# Milestone: FORMULA-ENGINE-001 / FORMULA-001B
#
# Deterministic regeneration of native Excel table calculated-column formulas.
# Uses Excel COM ListObject API only (never ExcelJS structured-ref cell.formula).
#
# Usage:
#   powershell -NoProfile -ExecutionPolicy Bypass -File scripts/formula_engine.ps1
#   powershell -NoProfile -ExecutionPolicy Bypass -File scripts/formula_engine.ps1 -WorkbookPath ".\workbook\FinanceOS_v1.0.xlsx"
#
# Idempotent: safe to re-run; overwrites the same calculated-column formulas.

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$WorkbookPath = ""
)

$ErrorActionPreference = 'Stop'

function Resolve-WorkbookPath {
    param([string]$Path)
    if ($Path -and (Test-Path -LiteralPath $Path)) {
        return (Resolve-Path -LiteralPath $Path).Path
    }
    $repoRoot = Split-Path -Parent $PSScriptRoot
    $canonical = Join-Path $repoRoot 'workbook\FinanceOS_v1.0.xlsx'
    if (-not (Test-Path -LiteralPath $canonical)) {
        throw "Canonical workbook not found: $canonical"
    }
    return (Resolve-Path -LiteralPath $canonical).Path
}

function Set-TableColumnFormula {
    param(
        [Parameter(Mandatory = $true)]$Worksheet,
        [Parameter(Mandatory = $true)][string]$TableName,
        [Parameter(Mandatory = $true)][string]$ColumnName,
        [Parameter(Mandatory = $true)][string]$Formula
    )

    $listObject = $Worksheet.ListObjects.Item($TableName)
    if ($null -eq $listObject) {
        throw "ListObject not found: $TableName on worksheet '$($Worksheet.Name)'"
    }

    $column = $listObject.ListColumns.Item($ColumnName)
    if ($null -eq $column) {
        throw "ListColumn not found: $TableName[$ColumnName]"
    }

    if ($null -eq $column.DataBodyRange) {
        throw "DataBodyRange missing for $TableName[$ColumnName] (table has no data rows)"
    }

    # Native Excel calculated-column assignment (creates/updates calculatedColumnFormula).
    $column.DataBodyRange.Formula = $Formula
}

function Invoke-WithSheetUnprotect {
    param(
        [Parameter(Mandatory = $true)]$Worksheet,
        [Parameter(Mandatory = $true)][scriptblock]$Action
    )

    $wasProtected = $false
    try {
        $wasProtected = [bool]$Worksheet.ProtectContents
    } catch {
        $wasProtected = $false
    }

    if ($wasProtected) {
        $Worksheet.Unprotect()
    }

    try {
        & $Action
    } finally {
        if ($wasProtected) {
            # WORKBOOK-003B user-sheet protection flags
            $Worksheet.Protect(
                '',
                $true,  # DrawingObjects
                $true,  # Contents
                $true,  # Scenarios
                $false, # UserInterfaceOnly
                $false, # AllowFormattingCells
                $false, # AllowFormattingColumns
                $false, # AllowFormattingRows
                $false, # AllowInsertingColumns
                $true,  # AllowInsertingRows
                $false, # AllowInsertingHyperlinks
                $false, # AllowDeletingColumns
                $true,  # AllowDeletingRows
                $true,  # AllowSorting
                $true,  # AllowFiltering
                $false  # AllowUsingPivotTables
            )
        }
    }
}

$xlsx = Resolve-WorkbookPath -Path $WorkbookPath
Write-Output "Formula Engine targeting: $xlsx"

$excel = $null
$wb = $null

try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $true
    $excel.DisplayAlerts = $false
    $excel.AskToUpdateLinks = $false
    $excel.ScreenUpdating = $false
    $excel.EnableEvents = $false
    $excel.AutomationSecurity = 1

    $wb = $excel.Workbooks.Open($xlsx, 0, $false)

    if (@($wb.Worksheets).Count -ne 14) {
        throw "Expected 14 worksheets, found $(@($wb.Worksheets).Count)"
    }

    # --- Assets / tblAssets ---
    $assets = $wb.Worksheets.Item('Assets')
    Invoke-WithSheetUnprotect -Worksheet $assets -Action {
        Set-TableColumnFormula -Worksheet $assets -TableName 'tblAssets' -ColumnName 'Appreciation Amount' -Formula '=[@[Current Value]]-[@[Purchase Value]]'
        Set-TableColumnFormula -Worksheet $assets -TableName 'tblAssets' -ColumnName 'Appreciation %' -Formula '=IFERROR([@[Appreciation Amount]]/[@[Purchase Value]],0)'
    }
    Write-Output 'Applied tblAssets[Appreciation Amount], tblAssets[Appreciation %]'

    # --- Goals / tblGoals ---
    $goals = $wb.Worksheets.Item('Goals')
    Invoke-WithSheetUnprotect -Worksheet $goals -Action {
        Set-TableColumnFormula -Worksheet $goals -TableName 'tblGoals' -ColumnName 'Remaining Amount' -Formula '=MAX(0,[@[Target Amount]]-[@[Current Saved Amount]])'
    }
    Write-Output 'Applied tblGoals[Remaining Amount]'

    $wb.Save()
    Write-Output 'Formula Engine complete (saved).'
}
finally {
    if ($null -ne $wb) {
        try { $wb.Close($false) } catch {}
    }
    if ($null -ne $excel) {
        try { $excel.Quit() } catch {}
        try {
            [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel)
        } catch {}
    }
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
}
