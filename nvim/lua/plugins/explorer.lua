return {
    -- the file explorer plugin
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false, -- make sure we load this during startup
        requires = {
            "nvim-tree/nvim-web-devicons" -- include nvim-tree icons
        },
        config = function()
            -- load default nvim-tree config
            require("nvim-tree").setup()
        end,
    }
}
