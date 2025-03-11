return {
    "mfussenegger/nvim-dap",
    lazy = false,
    priority = 950,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        {
            "williamboman/mason.nvim",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, "js-debug-adapter")
            end,
        },
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        require("lazydev").setup({
            library = { "nvim-dap-ui" },
        })
        dapui.setup()

        require("nvim-dap-virtual-text").setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        local dapDebugServerPath = require("mason-registry").get_package("js-debug-adapter"):get_install_path() .. "/js-debug/src/dapDebugServer.js"
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                -- 💀 Make sure to update this path to point to your installation
                args = { dapDebugServerPath, "${port}" },
            }
        }
    end
}
