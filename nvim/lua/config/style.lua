vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted when indenting
vim.o.tabstop = 4
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.wrap = true
vim.o.linebreak = true -- break by word rather than char
vim.o.breakindent = true

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4

vim.cmd("set number norelativenumber") -- Enable line number

vim.g.rust_recommended_style = 0

vim.fn.sign_define("DapBreakpoint", { text = "● ", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "● ", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "● ", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→ ", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
