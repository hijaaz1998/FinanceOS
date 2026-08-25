const ExcelJS = require("exceljs");
const path = require("path");

const OUT = path.join(
  "c:/Users/HIJAAZ/Downloads/FinanceOS/Cursor Development/FinanceOS/workbook",
  "FinanceOS_v1.0.xlsx"
);

const TABLE_STYLE = {
  theme: "TableStyleMedium2",
  showRowStripes: true,
};

const USER_PROTECT = {
  selectLockedCells: true,
  selectUnlockedCells: true,
  formatCells: false,
  formatColumns: false,
  formatRows: false,
  insertRows: true,
  insertColumns: false,
  insertHyperlinks: false,
  deleteRows: true,
  deleteColumns: false,
  sort: true,
  autoFilter: true,
  pivotTables: false,
};

const ENGINE_PROTECT = {
  ...USER_PROTECT,
  insertRows: false,
  deleteRows: false,
  sort: false,
  autoFilter: false,
};

const ENTITY_TABLES = [
  {
    sheet: "Settings",
    table: "tblSettings",
    columns: [
      "Setting ID",
      "Setting Name",
      "Setting Value",
      "Setting Category",
      "Description",
    ],
    locked: ["Setting ID", "Setting Name", "Setting Category", "Description"],
  },
  {
    sheet: "Categories",
    table: "tblCategories",
    columns: [
      "Category ID",
      "Category Name",
      "Category Type",
      "Parent Category",
      "Status",
      "Display Order",
      "Notes",
    ],
    locked: ["Category ID"],
  },
  {
    sheet: "Accounts",
    table: "tblAccounts",
    columns: [
      "Account ID",
      "Account Name",
      "Account Type",
      "Institution",
      "Opening Balance",
      "Current Balance",
      "Currency",
      "Status",
      "Notes",
    ],
    locked: ["Account ID", "Current Balance"],
  },
  {
    sheet: "Income Sources",
    table: "tblIncomeSources",
    columns: [
      "Income Source ID",
      "Income Source Name",
      "Income Category",
      "Default Receiving Account",
      "Status",
      "Notes",
    ],
    locked: ["Income Source ID"],
  },
  {
    sheet: "Assets",
    table: "tblAssets",
    columns: [
      "Asset ID",
      "Asset Name",
      "Asset Category",
      "Asset Type",
      "Linked Account",
      "Purchase Date",
      "Purchase Value",
      "Current Value",
      "Appreciation Amount",
      "Appreciation %",
      "Ownership Type",
      "Status",
      "Notes",
    ],
    locked: ["Asset ID", "Appreciation Amount", "Appreciation %"],
  },
  {
    sheet: "Liabilities",
    table: "tblLiabilities",
    columns: [
      "Liability ID",
      "Liability Name",
      "Liability Type",
      "Institution",
      "Original Amount",
      "Outstanding Balance",
      "Interest Rate",
      "EMI Amount",
      "EMI Frequency",
      "EMI Due Day",
      "Start Date",
      "End Date",
      "Linked Payment Account",
      "Auto EMI",
      "Status",
      "Notes",
    ],
    locked: ["Liability ID"],
  },
  {
    sheet: "Recurring Commitments",
    table: "tblRecurringCommitments",
    columns: [
      "Commitment ID",
      "Commitment Name",
      "Commitment Type",
      "Linked Liability ID",
      "Linked Goal ID",
      "Payment Account",
      "Amount",
      "Frequency",
      "Due Day",
      "Start Date",
      "End Date",
      "Auto Generate",
      "Status",
      "Notes",
    ],
    locked: ["Commitment ID"],
  },
  {
    sheet: "Transactions",
    table: "tblTransactions",
    columns: [
      "Transaction ID",
      "Transaction Date",
      "Transaction Type",
      "Source Account",
      "Destination Type",
      "Destination Name",
      "Category",
      "Income Source",
      "Amount",
      "Payment Method",
      "Transaction Status",
      "Notes",
      "Created Timestamp",
    ],
    locked: ["Transaction ID", "Created Timestamp"],
  },
  {
    sheet: "Goals",
    table: "tblGoals",
    columns: [
      "Goal ID",
      "Goal Name",
      "Goal Category",
      "Goal Account",
      "Target Amount",
      "Current Saved Amount",
      "Remaining Amount",
      "Monthly Contribution Target",
      "Target Date",
      "Priority",
      "Goal Status",
      "Notes",
    ],
    locked: ["Goal ID", "Current Saved Amount", "Remaining Amount"],
  },
];

const SHEET_ORDER = [
  "Settings",
  "Categories",
  "Accounts",
  "Income Sources",
  "Assets",
  "Liabilities",
  "Recurring Commitments",
  "Transactions",
  "Goals",
  "Helpers",
  "Business Engine",
  "Analysis Engine",
  "Dashboard",
  "Insights",
];

const HIDDEN_SHEETS = new Set(["Helpers", "Analysis Engine"]);
const ENGINE_SHEETS = new Set([
  "Helpers",
  "Business Engine",
  "Analysis Engine",
  "Dashboard",
  "Insights",
]);

const MONTHS = [
  [1, "January", "Jan"],
  [2, "February", "Feb"],
  [3, "March", "Mar"],
  [4, "April", "Apr"],
  [5, "May", "May"],
  [6, "June", "Jun"],
  [7, "July", "Jul"],
  [8, "August", "Aug"],
  [9, "September", "Sep"],
  [10, "October", "Oct"],
  [11, "November", "Nov"],
  [12, "December", "Dec"],
];

function colLetter(n) {
  let s = "";
  while (n > 0) {
    const m = (n - 1) % 26;
    s = String.fromCharCode(65 + m) + s;
    n = Math.floor((n - 1) / 26);
  }
  return s;
}

function freezeHeader(ws) {
  ws.views = [
    {
      state: "frozen",
      xSplit: 0,
      ySplit: 1,
      topLeftCell: "A2",
      activeCell: "A2",
    },
  ];
}

function addEntityTable(ws, spec) {
  const headers = spec.columns;
  const lastCol = colLetter(headers.length);
  ws.addTable({
    name: spec.table,
    ref: `A1:${lastCol}1`,
    headerRow: true,
    totalsRow: false,
    style: TABLE_STYLE,
    columns: headers.map((name) => ({ name, filterButton: true })),
    rows: [],
  });
  freezeHeader(ws);
}

function addLookupTable(ws, startRow, name, headers, dataRows) {
  const rows = dataRows.length ? dataRows : [headers.map(() => null)];
  const lastCol = colLetter(headers.length);
  const endRow = startRow + rows.length;
  ws.addTable({
    name,
    ref: `A${startRow}:${lastCol}${endRow}`,
    headerRow: true,
    totalsRow: false,
    style: TABLE_STYLE,
    columns: headers.map((h) => ({ name: h, filterButton: true })),
    rows,
  });
  return {
    endRow,
    dataStart: startRow + 1,
    dataEnd: endRow,
  };
}

async function main() {
  const wb = new ExcelJS.Workbook();
  wb.creator = "FinanceOS";
  wb.lastModifiedBy = "FinanceOS Phase 1 Foundation";
  wb.created = new Date();
  wb.modified = new Date();
  wb.calcProperties.fullCalcOnLoad = true;

  const sheets = {};
  for (const name of SHEET_ORDER) {
    sheets[name] = wb.addWorksheet(name, {
      views: [{ state: "normal", activeCell: "A1" }],
    });
    sheets[name].state = HIDDEN_SHEETS.has(name) ? "hidden" : "visible";
  }

  for (const spec of ENTITY_TABLES) {
    addEntityTable(sheets[spec.sheet], spec);
  }

  const helpers = sheets.Helpers;
  let row = 1;
  const lookups = {};

  lookups.lkpCurrency = addLookupTable(
    helpers,
    row,
    "lkpCurrency",
    ["Currency Code", "Currency Name", "Symbol"],
    [
      ["INR", null, null],
      ["USD", null, null],
      ["EUR", null, null],
      ["GBP", null, null],
      ["AED", null, null],
    ]
  );
  row = lookups.lkpCurrency.endRow + 3;

  const simpleLookups = [
    ["lkpPaymentMethod", "Payment Method", [
      "Bank Transfer",
      "Cash",
      "UPI",
      "Debit Card",
      "Credit Card",
      "Wallet",
      "Net Banking",
      "Other",
    ]],
    ["lkpTransactionType", "Transaction Type", [
      "Income",
      "Expense",
      "Transfer",
      "Adjustment",
    ]],
    ["lkpDestinationType", "Destination Type", [
      "Expense Category",
      "Income Category",
      "Account",
      "Goal",
      "Liability",
      "Asset",
      "Other",
    ]],
    ["lkpFrequency", "Frequency", [
      "Monthly",
      "Quarterly",
      "Half-Yearly",
      "Yearly",
    ]],
    ["lkpPriority", "Priority", ["High", "Medium", "Low"]],
    ["lkpStatus", "Status", [
      "Active",
      "Inactive",
      "Paused",
      "Completed",
      "Closed",
    ]],
    ["lkpGoalStatus", "Goal Status", [
      "Active",
      "Paused",
      "Completed",
    ]],
    ["lkpLiabilityStatus", "Liability Status", ["Active", "Closed"]],
    ["lkpAccountStatus", "Account Status", ["Active", "Closed"]],
    ["lkpCommitmentStatus", "Commitment Status", [
      "Active",
      "Paused",
      "Completed",
    ]],
    ["lkpOwnershipType", "Ownership Type", ["Individual", "Joint"]],
    ["lkpYesNo", "Yes No", ["Yes", "No"]],
    ["lkpAccountType", "Account Type", [
      "Savings Bank",
      "Current Bank",
      "Cash",
      "Wallet",
      "UPI",
      "Credit Card",
      "Investment Account",
      "Other",
    ]],
    ["lkpCategoryType", "Category Type", ["Income", "Expense"]],
    ["lkpTheme", "Theme", ["FinanceOS Default"]],
  ];

  for (const [name, header, values] of simpleLookups) {
    lookups[name] = addLookupTable(
      helpers,
      row,
      name,
      [header],
      values.map((v) => [v])
    );
    row = lookups[name].endRow + 3;
  }

  lookups.lkpMonth = addLookupTable(
    helpers,
    row,
    "lkpMonth",
    ["Month Number", "Month Name", "Short Name"],
    MONTHS
  );
  row = lookups.lkpMonth.endRow + 3;

  lookups.lkpFinancialYear = addLookupTable(
    helpers,
    row,
    "lkpFinancialYear",
    ["Financial Year"],
    [[null]]
  );
  row = lookups.lkpFinancialYear.endRow + 3;

  const valNames = [
    "valExpenseCategories",
    "valIncomeCategories",
    "valActiveAccounts",
    "valActiveGoals",
    "valActiveAssets",
    "valActiveLiabilities",
    "valIncomeSources",
    "valPaymentMethods",
    "valFrequency",
    "valPriority",
    "valAccountTypes",
    "valCategoryTypes",
    "valThemes",
    "valCurrencies",
    "valDestinationTypes",
    "valTransactionTypes",
    "valGoalStatus",
    "valAccountStatus",
    "valCommitmentStatus",
  ];

  helpers.getCell(row, 1).value = "Validation Output Placeholders";
  row += 1;
  const valCells = {};
  valNames.forEach((name, i) => {
    const r = row + i;
    helpers.getCell(r, 1).value = name;
    helpers.getCell(r, 2).value = null;
    valCells[name] = `Helpers!$B$${r}`;
  });

  function dataRange(meta, colIndex) {
    const col = colLetter(colIndex);
    return `Helpers!$${col}$${meta.dataStart}:$${col}$${meta.dataEnd}`;
  }

  const defined = [
    ["rngCurrency", dataRange(lookups.lkpCurrency, 1)],
    ["rngMonths", dataRange(lookups.lkpMonth, 2)],
    ["rngFinancialYears", dataRange(lookups.lkpFinancialYear, 1)],
    ["rngPaymentMethods", dataRange(lookups.lkpPaymentMethod, 1)],
    ["rngPriority", dataRange(lookups.lkpPriority, 1)],
    ["rngActiveAccounts", valCells.valActiveAccounts],
    ["rngExpenseCategories", valCells.valExpenseCategories],
    ["rngIncomeCategories", valCells.valIncomeCategories],
    ["rngActiveGoals", valCells.valActiveGoals],
    ["rngActiveAssets", valCells.valActiveAssets],
    ["rngActiveLiabilities", valCells.valActiveLiabilities],
    ["valExpenseCategories", valCells.valExpenseCategories],
    ["valIncomeCategories", valCells.valIncomeCategories],
    ["valActiveAccounts", valCells.valActiveAccounts],
    ["valActiveGoals", valCells.valActiveGoals],
    ["valActiveAssets", valCells.valActiveAssets],
    ["valActiveLiabilities", valCells.valActiveLiabilities],
    ["valIncomeSources", valCells.valIncomeSources],
    ["valPaymentMethods", valCells.valPaymentMethods],
    ["valFrequency", valCells.valFrequency],
    ["valPriority", valCells.valPriority],
    ["valAccountTypes", valCells.valAccountTypes],
    ["valCategoryTypes", valCells.valCategoryTypes],
    ["valThemes", valCells.valThemes],
    ["valCurrencies", valCells.valCurrencies],
    ["valDestinationTypes", valCells.valDestinationTypes],
    ["valTransactionTypes", valCells.valTransactionTypes],
    ["valGoalStatus", valCells.valGoalStatus],
    ["valAccountStatus", valCells.valAccountStatus],
    ["valCommitmentStatus", valCells.valCommitmentStatus],
  ];

  for (const [name, ref] of defined) {
    wb.definedNames.add(ref, name);
  }

  freezeHeader(helpers);

  for (const name of ["Business Engine", "Analysis Engine", "Dashboard", "Insights"]) {
    sheets[name].getCell("A1").value = name;
    sheets[name].getCell("A1").font = { bold: true };
  }

  for (const name of SHEET_ORDER) {
    const ws = sheets[name];
    const opts = ENGINE_SHEETS.has(name) ? ENGINE_PROTECT : USER_PROTECT;
    await ws.protect("", opts);
  }

  await wb.xlsx.writeFile(OUT);
  console.log("Wrote", OUT);
  console.log(
    "Sheets",
    wb.worksheets.map((s) => `${s.name}:${s.state}`).join(" | ")
  );
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
