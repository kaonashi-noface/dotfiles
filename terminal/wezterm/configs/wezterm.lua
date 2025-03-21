-- Load wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
local font_type = "MesloLGS Nerd Font Mono"

--[[
    DEFINE WEZTERM UI SETTINGS
]]
-- Configure Window Behavior
config.initial_cols = 110
config.initial_rows = 30
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_frame = {
    font = wezterm.font { family = font_type, weight = 'Bold' },
    -- The size of the font in the tab bar.
    -- Default to 10.0 on Windows but 12.0 on other systems
    font_size = 14.0,
}

--[[
    DEFINE WEZTERM THEMES AND APPEARANCES
]]
-- Set Wezterm Terminal Theme
config.color_scheme = "Tokyo Night"
-- Set Background Image
config.background = {
    {
        source = {
            File = os.getenv("HOME") .. "/.local/share/backgrounds/lake-wallpaper.png",
        },
        width = "100%",
        height = "100%",
        hsb = {
            hue = 1.0,
            saturation = 1.02,
            brightness = 0.25,
        },
    },
    {
        source = {
            Color = "#282c35",
        },
        width = "100%",
        height = "100%",
        opacity = 0.65,
    },
}
-- Set Nerd Font
config.font = wezterm.font_with_fallback({
    { family = font_type, weight = "Bold" },
})
config.font_size = 16

return config
