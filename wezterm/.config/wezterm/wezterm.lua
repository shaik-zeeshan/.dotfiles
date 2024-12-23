-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 0,
}

config.color_scheme = "Chalk (dark) (terminal.sexy)"
local act = wezterm.action

config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

config.set_environment_variables = {
	TERM = "xterm-256color",
}

config.font = wezterm.font("GeistMono Nerd Font Mono", { weight = "Bold" })
config.font_size = 12
config.line_height = 1.30

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 8

-- and finally, return the configuration to wezterm
return config
