return {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local lazy = require("lazy")

        math.randomseed(os.time())

        local function pick_color()
            local colors = {"String", "Identifier", "Keyword", "Number"}
            return colors[math.random(#colors)]
        end

        local function footer()
            local total_plugins = lazy.stats().count
            local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
            local version = vim.version()
            local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

            return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
        end

        local logo = {
            "",
            "",
            "",
            "",
            "",
            "",
            "                                                    ",
            " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        }

        dashboard.section.header.val = logo
        dashboard.section.header.opts.hl = pick_color()

        dashboard.section.buttons.val = {
            dashboard.button("<Leader>e", "  File Explorer"),
            dashboard.button("<Leader>ff", "  Telescope Find File"),
            dashboard.button(":Lazy update", "  Update plugins"),
            dashboard.button(":q", "  Quit", ":qa<cr>")
        }

        dashboard.section.footer.val = footer()
        dashboard.section.footer.opts.hl = "Constant"

        alpha.setup(dashboard.opts)

        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end
}
