-- Import & load neovim plugin manager
require("manager.lazy")

-- Import & load custom settings
require("config.style")
require("config.node-debug-configs")
require("config.codelldb-debug-configs")
require("config.go-debug-configs")

-- Import & load custom keymappings
require("keymaps.telescope")
require("keymaps.nvim-tree")
require("keymaps.debugger")

vim.o.filetype = "on"