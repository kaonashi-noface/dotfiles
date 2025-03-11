vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.cmd("set number norelativenumber") -- Enable line number


vim.fn.sign_define("DapBreakpoint", { text = "● ", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "● ", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "● ", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→ ", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text="❌", texthl="DiagnosticSignHint", linehl="", numhl="" })
