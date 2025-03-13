local dap = require("dap")

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			name = "Debug Current File",
			type = "pwa-node",
			request = "launch",
			cwd = "${workspaceFolder}",
			program = "${file}",
			outputCapture = "std",
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
		},
		{
			name = "NPM - Test",
			type = "pwa-node",
			request = "launch",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "npm",
			runtimeArgs = {
				"run-script",
				"test",
			},
			outputCapture = "std",
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
		},
	}
end
