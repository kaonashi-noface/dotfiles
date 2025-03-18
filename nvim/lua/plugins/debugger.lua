return {
	"mfussenegger/nvim-dap",
	lazy = false,
	priority = 950,
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "js-debug-adapter")
				table.insert(opts.ensure_installed, "codelldb")
			end,
		},
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		-- Import Dap & Dap UI
		local dap, dapui = require("dap"), require("dapui")

		-- Initialize Dap UI
		require("lazydev").setup({
			library = { "nvim-dap-ui" },
		})
		dapui.setup()

		-- Initialize Dap Virtual Text
		require("nvim-dap-virtual-text").setup()

		-- Add Event Listeners for automatically opening Dap UI
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		-- Setup JavaScript Adapter
		local dapDebugServerPath = require("mason-registry").get_package("js-debug-adapter"):get_install_path()
			.. "/js-debug/src/dapDebugServer.js"
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = { dapDebugServerPath, "${port}" },
			},
		}

		-- Setup C/C++/Rust Adapter
		local dapExecutablePath = require("mason-registry").get_package("codelldb"):get_install_path() .. "/codelldb"
		dap.adapters["codelldb"] = {
			type = "executable",
			command = dapExecutablePath, -- or if not in $PATH: "/absolute/path/to/codelldb"
		}
	end,
}
