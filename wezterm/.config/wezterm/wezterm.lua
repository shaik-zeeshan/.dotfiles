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

local neofusion_theme = {
    foreground = "#e0d9c7",
    background = "#070f1c",
    cursor_bg = "#e0d9c7",
    cursor_border = "#e0d9c7",
    cursor_fg = "#070f1c",
    selection_bg = "#ea6847",
    selection_fg = "#e0d9c7",
    ansi = {
        "#070f1c", -- Black (Host)
        "#ea6847", -- Red (Syntax string)
        "#ea6847", -- Green (Command)
        "#5db2f8", -- Yellow (Command second)
        "#2f516c", -- Blue (Path)
        "#d943a8", -- Magenta (Syntax var)
        "#86dbf5", -- Cyan (Prompt)
        "#e0d9c7", -- White
    },
    brights = {
        "#2f516c", -- Bright Black
        "#d943a8", -- Bright Red (Command error)
        "#ea6847", -- Bright Green (Exec)
        "#86dbf5", -- Bright Yellow
        "#5db2f8", -- Bright Blue (Folder)
        "#d943a8", -- Bright Magenta
        "#ea6847", -- Bright Cyan
        "#e0d9c7", -- Bright White
    },
}
-- config.colors = neofusion_theme
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
