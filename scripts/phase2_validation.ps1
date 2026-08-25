# VALIDATION-002 — Dynamic Entity Dropdown Engine
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$repoXlsx = 'c:\Users\HIJAAZ\Downloads\FinanceOS\Cursor Development\FinanceOS\workbook\FinanceOS_v1.0.xlsx'
$build = Join-Path $env:TEMP 'FinanceOS_v1.0_validation002.xlsx'
Copy-Item -LiteralPath $repoXlsx -Destination $build -Force

function List-DV([string]$sqref, [string]$rngName) {
  return "<dataValidation type=`"list`" allowBlank=`"1`" showInputMessage=`"1`" promptTitle=`"Select a value`" prompt=`"Choose from the list.`" showErrorMessage=`"1`" errorStyle=`"stop`" errorTitle=`"Invalid value`" error=`"Select a value from the list.`" sqref=`"$sqref`"><formula1>=$rngName</formula1></dataValidation>"
}

function Set-SheetValidations([string]$xml, [string[]]$rules) {
  $xml = [regex]::Replace($xml, '<dataValidations[\s\S]*?</dataValidations>', '')
  if ($null -eq $rules -or $rules.Count -eq 0) { return $xml }
  $block = '<dataValidations count="' + $rules.Count + '">' + ($rules -join '') + '</dataValidations>'
  if ($xml -match '<pageMargins') { return $xml.Replace('<pageMargins', $block + '<pageMargins') }
  if ($xml -match '<tableParts') { return $xml.Replace('<tableParts', $block + '<tableParts') }
  return $xml.Replace('</worksheet>', $block + '</worksheet>')
}

$zip = [System.IO.Compression.ZipFile]::Open($build, [System.IO.Compression.ZipArchiveMode]::Update)

function Get-Text([string]$name) {
  $e = $zip.GetEntry($name)
  if (-not $e) { throw "Missing entry: $name" }
  $sr = New-Object System.IO.StreamReader($e.Open())
  $t = $sr.ReadToEnd(); $sr.Close(); return $t
}
function Set-Text([string]$name, [string]$text) {
  $old = $zip.GetEntry($name)
  if ($old) { $old.Delete() }
  $ne = $zip.CreateEntry($name)
  $sw = New-Object System.IO.StreamWriter($ne.Open())
  $sw.Write($text); $sw.Flush(); $sw.Close()
}

# Pre-flight architecture
$wbxml = Get-Text 'xl/workbook.xml'
if ($wbxml -notmatch 'lockStructure="1"') { throw 'FAIL: structure lock missing' }
$sheetCount = ([regex]::Matches($wbxml, '<sheet ')).Count
if ($sheetCount -ne 14) { throw "FAIL: expected 14 sheets, found $sheetCount" }

# Upsert dynamic entity named ranges (structured references; no OFFSET/INDIRECT/SWITCH)
$dynamic = [ordered]@{
  rngAccounts      = 'tblAccounts[Account Name]'
  rngCategories    = 'tblCategories[Category Name]'
  rngIncomeSources = 'tblIncomeSources[Income Source Name]'
  rngGoals         = 'tblGoals[Goal Name]'
  rngAssets        = 'tblAssets[Asset Name]'
  rngLiabilities   = 'tblLiabilities[Liability Name]'
}

$names = [ordered]@{}
[regex]::Matches($wbxml, '<definedName name="([^"]+)"([^>]*)>([^<]*)</definedName>') | ForEach-Object {
  $names[$_.Groups[1].Value] = @{ attrs = $_.Groups[2].Value; value = $_.Groups[3].Value }
}

foreach ($k in $dynamic.Keys) {
  if ($names.Contains($k)) {
    $names[$k].value = $dynamic[$k]
  } else {
    $names[$k] = @{ attrs = ''; value = $dynamic[$k] }
  }
}

$nameXml = ($names.GetEnumerator() | ForEach-Object {
  '<definedName name="' + $_.Key + '"' + $_.Value.attrs + '>' + $_.Value.value + '</definedName>'
}) -join ''

$wbxml = [regex]::Replace($wbxml, '<definedNames>[\s\S]*?</definedNames>', '')
$wbxml = $wbxml.Replace('</sheets>', '</sheets><definedNames>' + $nameXml + '</definedNames>')
Set-Text 'xl/workbook.xml' $wbxml

# Assets: keep Asset Type; add Linked Account (E)
$s = Get-Text 'xl/worksheets/sheet5.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'D2' 'rngAssetType'),
  (List-DV 'E2' 'rngAccounts')
)
Set-Text 'xl/worksheets/sheet5.xml' $s

# Liabilities: keep Type + EMI Frequency; add Linked Payment Account (M)
$s = Get-Text 'xl/worksheets/sheet6.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'C2' 'rngLiabilityType'),
  (List-DV 'I2' 'rngFrequency'),
  (List-DV 'M2' 'rngAccounts')
)
Set-Text 'xl/worksheets/sheet6.xml' $s

# Transactions: keep Type + Payment Method; Category -> rngCategories; add entity DVs
$s = Get-Text 'xl/worksheets/sheet8.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'C2' 'rngTransactionType'),
  (List-DV 'D2' 'rngAccounts'),
  (List-DV 'F2' 'rngAccounts'),
  (List-DV 'G2' 'rngCategories'),
  (List-DV 'H2' 'rngIncomeSources'),
  (List-DV 'J2' 'rngPaymentMethods')
)
Set-Text 'xl/worksheets/sheet8.xml' $s

# Goals: keep Priority + Goal Status; add Goal Account (D)
$s = Get-Text 'xl/worksheets/sheet9.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'D2' 'rngAccounts'),
  (List-DV 'J2' 'rngPriority'),
  (List-DV 'K2' 'rngGoalStatus')
)
Set-Text 'xl/worksheets/sheet9.xml' $s

$zip.Dispose()
Copy-Item -LiteralPath $build -Destination $repoXlsx -Force
Write-Output 'VALIDATION-002 applied'
