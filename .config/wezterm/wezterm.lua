local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Use a dark colorscheme instead of setting background directly
-- config.color_scheme = "Catpuccin Latte"

-- Opacity for transparency
config.window_background_opacity = 0.75

-- Disable tab bar
config.enable_tab_bar = false

-- Window padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
--SauceCodePro NF SemiBold
-- Font
-- config.font = wezterm.font("LigaSauceCodePro Nerd Font", {
-- 	weight = "DemiBold",
-- 	italic = false,
-- })
--
--


config.font = wezterm.font_with_fallback({
	{
		family = "LigaSauceCodePro Nerd Font",
		weight = "Medium",
		italic = false,
	},
	"Noto Color Emoji",
})
config.font_size = 12

-- 2. The "Ghostty Brightness" Fix (Valid for your version)
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.0,
  brightness = 1.25, -- Increases white intensity
}

-- 3. Rendering Engine
config.front_end = "OpenGL"


-- Cursor
config.default_cursor_style = "BlinkingBar"

-- Smooth cursor animation
config.animation_fps = 60
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.term = "xterm-256color"

-- wezterm.on("user-var-changed", function(window, pane, name, value)
-- 	userVars = pane:get_user_vars()
-- 	overrides = window:get_config_overrides() or {}
-- 	print(overrides)
-- 	if string.match(userVars["WEZTERM_PROG"], "nvim") then
-- 		overrides.font = wezterm.font({
-- 			family = "Iosevka Nerd Font", -- The Font in Nvim
-- 		})
-- 		overrides.font_size = 12.0 -- change font size for Neovim
-- 	else
-- 		overrides = nil
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

config.scrollback_lines = 2000
return config
