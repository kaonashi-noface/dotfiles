-- Load wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

--[[
    DEFINE WEZTERM THEMES AND APPEARANCES
]]
-- Set Wezterm Terminal Theme
config.color_scheme = "TokyoNight"
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
config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = "Bold" })
config.font_size = 15
-- Configure Window Behavior
config.initial_cols = 160
config.initial_rows = 45
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

return config
