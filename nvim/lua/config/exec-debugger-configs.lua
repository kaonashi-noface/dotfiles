local dap = require("dap")

for _, language in ipairs({ "rust", "cpp", "c" }) do
	dap.configurations[language] = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				os.execute("cargo build --quiet")
				return vim.fn.getcwd() .. "/target/debug/${workspaceFolderBasename}"
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}
end
