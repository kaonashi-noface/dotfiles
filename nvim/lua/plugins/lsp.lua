return {
	"neovim/nvim-lspconfig",
	lazy = false,
	priority = 999,
	dependencies = {
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		require("lspconfig").lua_ls.setup({
			capabilities = capabilities,
		})
		require("lspconfig").ts_ls.setup({
			capabilities = capabilities,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})
		require("lspconfig").rust_analyzer.setup({
			capabilities = capabilities,
		})
	end,
}
