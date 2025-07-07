local home_directory = os.getenv("HOME")

package.path = package.path .. ";" .. home_directory .. "/.cache/wal/?.lua"
local theme = require("neovim-theme")

require("mini.base16").setup({
	palette = {
		base00 = theme.base00,
		base01 = theme.base01,
		base02 = theme.base02,
		base03 = theme.base03,
		base04 = theme.base04,
		base05 = theme.base05,
		base06 = theme.base06,
		base07 = theme.base07,
		base08 = theme.base08,
		base09 = theme.base09,
		base0A = theme.base0A,
		base0B = theme.base0B,
		base0C = theme.base0C,
		base0D = theme.base0D,
		base0E = theme.base0E,
		base0F = theme.base0F,
	},
	use_cterm = true,
})
