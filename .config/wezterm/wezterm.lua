local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Use a dark colorscheme instead of setting background directly
config.color_scheme = "Catpuccin Latte"

-- Opacity for transparency
config.window_background_opacity = 0.75 -- notice the full name

-- Disable tab bar
config.enable_tab_bar = false

-- Window padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- Font
config.font = wezterm.font("LigaSauceCodePro Nerd Font", {
	weight = "DemiBold", -- use DemiBold instead of Semibold
	italic = false, -- true if you want italic
})
config.font_size = 11.5

-- Cursor
config.default_cursor_style = "BlinkingBar"

config.term = "xterm-256color"

return config
