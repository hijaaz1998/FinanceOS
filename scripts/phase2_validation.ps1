# VALIDATION-001 — Validation Layer V2 (canonical workbook)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$repoXlsx = 'c:\Users\HIJAAZ\Downloads\FinanceOS\Cursor Development\FinanceOS\workbook\FinanceOS_v1.0.xlsx'
$build = Join-Path $env:TEMP 'FinanceOS_v1.0_validation001.xlsx'
Copy-Item -LiteralPath $repoXlsx -Destination $build -Force

$assetTypes = @(
  'Mutual Fund','Stock','ETF','Gold ETF','Bond','SIP','Fixed Deposit','PPF','EPF','NPS',
  'Gold Jewellery','Gold Coin','Vehicle','Electronics','Furniture','Watch','Other Physical Asset',
  'Residential Property','Commercial Property','Land','Plot',
  'Emergency Cash','Foreign Currency','Cash Reserve'
)
$liabilityTypes = @(
  'Home Loan','Personal Loan','Education Loan','Vehicle Loan','Gold Loan',
  'Credit Card','Buy Now Pay Later','Family Loan','Business Loan','Other Liability'
)
# DOC-007 Income Sources examples + Investment from column description
$incomeTypes = @(
  'Salary','Freelance','Bonus','Rental Income','Interest','Cashback','Refund','Business Income','Investment'
)

function Escape-Xml([string]$s) {
  return ($s -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;' -replace '"','&quot;')
}

function New-LookupTableXml([int]$id, [string]$name, [string]$header, [string]$ref) {
  $cols = '<tableColumns count="1"><tableColumn id="1" name="' + (Escape-Xml $header) + '"/></tableColumns>'
  return @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<table xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" id="$id" name="$name" displayName="$name" ref="$ref" totalsRowShown="0" headerRowCount="1"><autoFilter ref="$ref"/>$cols<tableStyleInfo name="TableStyleMedium2" showFirstColumn="0" showLastColumn="0" showRowStripes="1" showColumnStripes="0"/></table>
"@
}

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

# --- sharedStrings: APPEND only (never renumber existing indices) ---
$ss = Get-Text 'xl/sharedStrings.xml'
$siMatches = [regex]::Matches($ss, '<si>[\s\S]*?</si>')
$existingCount = $siMatches.Count
$indexOf = @{}
for ($i = 0; $i -lt $siMatches.Count; $i++) {
  $m = [regex]::Match($siMatches[$i].Value, '<t(?: xml:space="preserve")?>([^<]*)</t>')
  if ($m.Success) {
    $txt = $m.Groups[1].Value
    if (-not $indexOf.ContainsKey($txt)) { $indexOf[$txt] = $i }
  }
}

function Get-OrAddString([string]$text) {
  if ($script:indexOf.ContainsKey($text)) { return [int]$script:indexOf[$text] }
  $idx = $script:existingCount + $script:newSiXml.Count
  $script:indexOf[$text] = $idx
  [void]$script:newSiXml.Add('<si><t>' + (Escape-Xml $text) + '</t></si>')
  return $idx
}

$newSiXml = New-Object System.Collections.Generic.List[string]
$headerAsset = Get-OrAddString 'Asset Type'
$headerLia = Get-OrAddString 'Liability Type'
$headerInc = Get-OrAddString 'Income Type'
# headers may already exist as column names on entity sheets
$assetIdx = @(); foreach ($v in $assetTypes) { $assetIdx += ,(Get-OrAddString $v) }
$liaIdx = @(); foreach ($v in $liabilityTypes) { $liaIdx += ,(Get-OrAddString $v) }
$incIdx = @(); foreach ($v in $incomeTypes) { $incIdx += ,(Get-OrAddString $v) }

if ($newSiXml.Count -gt 0) {
  $total = $existingCount + $newSiXml.Count
  $ss = [regex]::Replace($ss, 'count="\d+"', 'count="' + $total + '"')
  $ss = [regex]::Replace($ss, 'uniqueCount="\d+"', 'uniqueCount="' + $total + '"')
  $ss = $ss.Replace('</sst>', ($newSiXml -join '') + '</sst>')
  Set-Text 'xl/sharedStrings.xml' $ss
}

# --- Helpers: inject AG/AH/AI lookup columns ---
$helpers = Get-Text 'xl/worksheets/sheet10.xml'
$helpers = [regex]::Replace($helpers, '<c r="AG\d+"[^/]*/>|<c r="AG\d+"[^>]*>[\s\S]*?</c>', '')
$helpers = [regex]::Replace($helpers, '<c r="AH\d+"[^/]*/>|<c r="AH\d+"[^>]*>[\s\S]*?</c>', '')
$helpers = [regex]::Replace($helpers, '<c r="AI\d+"[^/]*/>|<c r="AI\d+"[^>]*>[\s\S]*?</c>', '')

$rowMap = @{}
$rowAttrs = @{}
[regex]::Matches($helpers, '<row([^>]*) r="(\d+)"([^>]*)>([\s\S]*?)</row>|<row r="(\d+)"([^>]*)>([\s\S]*?)</row>') | ForEach-Object {
  if ($_.Groups[5].Success) {
    $r = [int]$_.Groups[5].Value
    $rowAttrs[$r] = $_.Groups[6].Value
    $rowMap[$r] = $_.Groups[7].Value
  } else {
    $r = [int]$_.Groups[2].Value
    $rowAttrs[$r] = ($_.Groups[1].Value + $_.Groups[3].Value)
    $rowMap[$r] = $_.Groups[4].Value
  }
}

function Add-Cell([int]$row, [string]$col, [int]$ssi) {
  $ref = "$col$row"
  $cell = "<c r=`"$ref`" t=`"s`"><v>$ssi</v></c>"
  $inner = if ($script:rowMap.ContainsKey($row)) { $script:rowMap[$row] } else { '' }
  $inner = [regex]::Replace($inner, "<c r=`"$ref`"[^/]*/>|<c r=`"$ref`"[^>]*>[\s\S]*?</c>", '')
  $script:rowMap[$row] = $inner + $cell
  if (-not $script:rowAttrs.ContainsKey($row)) { $script:rowAttrs[$row] = '' }
}

Add-Cell 1 'AG' $headerAsset
for ($i = 0; $i -lt $assetIdx.Count; $i++) { Add-Cell ($i + 2) 'AG' $assetIdx[$i] }
Add-Cell 1 'AH' $headerLia
for ($i = 0; $i -lt $liaIdx.Count; $i++) { Add-Cell ($i + 2) 'AH' $liaIdx[$i] }
Add-Cell 1 'AI' $headerInc
for ($i = 0; $i -lt $incIdx.Count; $i++) { Add-Cell ($i + 2) 'AI' $incIdx[$i] }

$maxRow = ($rowMap.Keys | Measure-Object -Maximum).Maximum
$sd = New-Object System.Text.StringBuilder
[void]$sd.Append('<sheetData>')
foreach ($r in ($rowMap.Keys | Sort-Object)) {
  $attrs = $rowAttrs[$r]
  if ($attrs -and $attrs.Trim().Length -gt 0) {
    # attrs may already include r= or not; normalize
    if ($attrs -match 'r="') {
      [void]$sd.Append("<row$attrs>" + $rowMap[$r] + '</row>')
    } else {
      [void]$sd.Append("<row r=`"$r`"$attrs>" + $rowMap[$r] + '</row>')
    }
  } else {
    [void]$sd.Append("<row r=`"$r`">" + $rowMap[$r] + '</row>')
  }
}
[void]$sd.Append('</sheetData>')
$helpers = [regex]::Replace($helpers, '<sheetData>[\s\S]*?</sheetData>', [System.Text.RegularExpressions.MatchEvaluator]{
  param($m)
  return $sd.ToString()
})

if ($helpers -match 'dimension ref="[^"]+"') {
  $helpers = [regex]::Replace($helpers, 'dimension ref="[^"]+"', 'dimension ref="A1:AI' + $maxRow + '"')
}

$assetRef = 'AG1:AG' + (1 + $assetTypes.Count)
$liaRef = 'AH1:AH' + (1 + $liabilityTypes.Count)
$incRef = 'AI1:AI' + (1 + $incomeTypes.Count)

Set-Text 'xl/tables/table28.xml' (New-LookupTableXml 28 'lkpAssetType' 'Asset Type' $assetRef)
Set-Text 'xl/tables/table29.xml' (New-LookupTableXml 29 'lkpLiabilityType' 'Liability Type' $liaRef)
Set-Text 'xl/tables/table30.xml' (New-LookupTableXml 30 'lkpIncomeType' 'Income Type' $incRef)

$ct = Get-Text '[Content_Types].xml'
foreach ($n in 28..30) {
  if ($ct -notmatch ("table$n\.xml")) {
    $override = '<Override PartName="/xl/tables/table' + $n + '.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.table+xml"/>'
    $ct = $ct.Replace('</Types>', $override + '</Types>')
  }
}
Set-Text '[Content_Types].xml' $ct

$rels = Get-Text 'xl/worksheets/_rels/sheet10.xml.rels'
if ($rels -notmatch 'table28.xml') {
  $rels = $rels.Replace('</Relationships>',
    '<Relationship Id="rId19" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/table" Target="../tables/table28.xml"/>' +
    '<Relationship Id="rId20" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/table" Target="../tables/table29.xml"/>' +
    '<Relationship Id="rId21" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/table" Target="../tables/table30.xml"/>' +
    '</Relationships>')
}
Set-Text 'xl/worksheets/_rels/sheet10.xml.rels' $rels

if ($helpers -match '<tableParts count="(\d+)">([\s\S]*?)</tableParts>') {
  $parts = $Matches[2]
  if ($parts -notmatch 'rId19') {
    $parts = $parts + '<tablePart r:id="rId19"/><tablePart r:id="rId20"/><tablePart r:id="rId21"/>'
    $helpers = [regex]::Replace($helpers, '<tableParts count="\d+">[\s\S]*?</tableParts>',
      '<tableParts count="21">' + $parts + '</tableParts>')
  }
} else {
  throw 'Helpers sheet missing tableParts'
}
Set-Text 'xl/worksheets/sheet10.xml' $helpers

# --- Named ranges: preserve all existing, upsert validation rng* ---
$wbxml = Get-Text 'xl/workbook.xml'
$names = [ordered]@{}
[regex]::Matches($wbxml, '<definedName name="([^"]+)"([^>]*)>([^<]*)</definedName>') | ForEach-Object {
  $names[$_.Groups[1].Value] = @{ attrs = $_.Groups[2].Value; value = $_.Groups[3].Value }
}

# Canonical VALIDATION-001 sources (A1 absolute). Upsert only these.
$upsert = @{
  rngCategoryType = 'Helpers!$A$102:$A$103'
  rngTransactionType = 'Helpers!$A$21:$A$24'
  rngAccountType = 'Helpers!$A$91:$A$98'
  rngFrequency = 'Helpers!$A$38:$A$41'
  rngGoalStatus = 'Helpers!$A$59:$A$61'
  rngBoolean = 'Helpers!$A$86:$A$87'
  rngPriority = 'Helpers!$A$45:$A$47'
  rngPaymentMethods = 'Helpers!$A$10:$A$17'
  rngAccountStatus = 'Helpers!$A$70:$A$71'
  rngAssetType = 'Helpers!$AG$2:$AG$' + (1 + $assetTypes.Count)
  rngLiabilityType = 'Helpers!$AH$2:$AH$' + (1 + $liabilityTypes.Count)
  rngIncomeType = 'Helpers!$AI$2:$AI$' + (1 + $incomeTypes.Count)
}
foreach ($k in $upsert.Keys) {
  if ($names.Contains($k)) {
    $names[$k].value = $upsert[$k]
  } else {
    $names[$k] = @{ attrs = ''; value = $upsert[$k] }
  }
}

# Never create rngPaymentMethod
if ($names.Contains('rngPaymentMethod')) { $names.Remove('rngPaymentMethod') }

$nameXml = ($names.GetEnumerator() | ForEach-Object {
  '<definedName name="' + $_.Key + '"' + $_.Value.attrs + '>' + $_.Value.value + '</definedName>'
}) -join ''

$wbxml = [regex]::Replace($wbxml, '<definedNames>[\s\S]*?</definedNames>', '')
if ($wbxml -notmatch 'lockStructure="1"') {
  if ($wbxml -match '<workbookProtection[^/]*/>') {
    $wbxml = [regex]::Replace($wbxml, '<workbookProtection[^/]*/>', '<workbookProtection lockStructure="1"/>')
  } else {
    $wbxml = [regex]::Replace($wbxml, '(<workbookPr[^/]*/>)', '$1<workbookProtection lockStructure="1"/>')
  }
}
$wbxml = $wbxml.Replace('</sheets>', '</sheets><definedNames>' + $nameXml + '</definedNames>')
Set-Text 'xl/workbook.xml' $wbxml

# --- Data validations (table body row 2 only) ---
# Categories: Category Type (C)
$s = Get-Text 'xl/worksheets/sheet2.xml'
$s = Set-SheetValidations $s @( (List-DV 'C2' 'rngCategoryType') )
Set-Text 'xl/worksheets/sheet2.xml' $s

# Accounts: Account Type (C), Status (H)
$s = Get-Text 'xl/worksheets/sheet3.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'C2' 'rngAccountType'),
  (List-DV 'H2' 'rngAccountStatus')
)
Set-Text 'xl/worksheets/sheet3.xml' $s

# Income Sources: Income Category (C) — Frequency skipped (Decision 2)
$s = Get-Text 'xl/worksheets/sheet4.xml'
$s = Set-SheetValidations $s @( (List-DV 'C2' 'rngIncomeType') )
Set-Text 'xl/worksheets/sheet4.xml' $s

# Assets: Asset Type (D) — Status skipped (no approved lookup table)
$s = Get-Text 'xl/worksheets/sheet5.xml'
$s = Set-SheetValidations $s @( (List-DV 'D2' 'rngAssetType') )
Set-Text 'xl/worksheets/sheet5.xml' $s

# Liabilities: Liability Type (C), EMI Frequency (I)
$s = Get-Text 'xl/worksheets/sheet6.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'C2' 'rngLiabilityType'),
  (List-DV 'I2' 'rngFrequency')
)
Set-Text 'xl/worksheets/sheet6.xml' $s

# Recurring: Frequency (H), Status (M) via rngBoolean (Decision 2); Payment Method skipped
$s = Get-Text 'xl/worksheets/sheet7.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'H2' 'rngFrequency'),
  (List-DV 'M2' 'rngBoolean')
)
Set-Text 'xl/worksheets/sheet7.xml' $s

# Transactions: Type (C), Category (G), Payment Method (J)
$s = Get-Text 'xl/worksheets/sheet8.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'C2' 'rngTransactionType'),
  (List-DV 'G2' 'rngCategoryType'),
  (List-DV 'J2' 'rngPaymentMethods')
)
Set-Text 'xl/worksheets/sheet8.xml' $s

# Goals: Priority (J), Goal Status (K)
$s = Get-Text 'xl/worksheets/sheet9.xml'
$s = Set-SheetValidations $s @(
  (List-DV 'J2' 'rngPriority'),
  (List-DV 'K2' 'rngGoalStatus')
)
Set-Text 'xl/worksheets/sheet9.xml' $s

# Settings: skipped (Decision 3)

$zip.Dispose()

Copy-Item -LiteralPath $build -Destination $repoXlsx -Force
Write-Output 'VALIDATION-001 applied'
Write-Output "lookups asset=$($assetTypes.Count) liability=$($liabilityTypes.Count) income=$($incomeTypes.Count)"
Write-Output "newSharedStrings=$($newSiXml.Count)"
