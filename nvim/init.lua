-- Import & load neovim plugin manager
require("manager.lazy")

-- Import & load custom keymappings
require("keymaps.telescope")
require("keymaps.nvim-tree")
require("keymaps.debugger")

-- Import & load custom settings
require("config.style")
require("config.node-debugger-configs")
