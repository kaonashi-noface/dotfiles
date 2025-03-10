return {
    -- lazy spec to build "microsoft/vscode-js-debug" from source
    {
        "microsoft/vscode-js-debug",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
            require("dap-vscode-js").setup({
                -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
                debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug", -- "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
                -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
                adapters = { "pwa-node" }, -- which adapters to register in nvim-dap
            })

            require("dap").adapters["pwa-node"] = {
                type = "server",
                host = "::1",
                port = "${port}",
                executable = {
                    command = "node",
                    -- 💀 Make sure to update this path to point to your installation
                    args = { (vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js"), "${port}"},
                }
            }
        end
    },
}
