for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            name = "Debug Current File",
            type = "pwa-node",
            request = "launch",
            cwd = "${workspaceFolder}",
            program = "${file}",
            outputCapture = "std",
        },
        {
            name = "NPM - Test",
            type = "pwa-node",
            request = "launch",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "npm",
            runtimeArgs = {
                "run-script",
                "test"
            },
            sourceMaps = true,
            outputCapture = "std"
        }
    }
end
