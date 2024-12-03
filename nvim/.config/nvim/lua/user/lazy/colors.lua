function ColorMyPencils(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.cmd("highlight telescopeborder guibg=none")
	vim.cmd("highlight telescopetitle guibg=none")
	vim.cmd("highlight linenr guibg=none")
end

return {
	-- {
	--     "diegoulloao/neofusion.nvim",
	--     priority = 1000,
	--     config = function()
	--         require("neofusion").setup({
	--             palette = "material",
	--             transparency = true,
	--             styles = {
	--                 comment = "italic",
	--                 keyword = "italic",
	--             },
	--         })
	--         ColorMyPencils("neofusion")
	--     end
	-- },
	--	{
	--		"folke/tokyonight.nvim",
	--		name = "tokyonight",
	--		config = function()
	--			require("tokyonight").setup({
	--				-- your configuration comes here
	--				-- or leave it empty to use the default settings
	--				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	--				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	--				styles = {
	--					-- Style to be applied to different syntax groups
	--					-- Value is any valid attr-list value for `:help nvim_set_hl`
	--					comments = { italic = false },
	--					keywords = { italic = false },
	--					-- Background styles. Can be "dark", "transparent" or "normal"
	--					sidebars = "transparent", -- style for sidebars, see below
	--					floats = "transparent", -- style for floating windows
	--				},
	--			})
	--			ColorMyPencils("tokyonight")
	--		end,
	--	},
	--    {
	--        "rose-pine/neovim",
	--        name = "rose-pine",
	--        config = function()
	--            require('rose-pine').setup({
	--            })
	--
	--            vim.cmd("colorscheme rose-pine")
	--
	--            ColorMyPencils()
	--        end
	--    },

	--	{
	--		"ellisonleao/gruvbox.nvim",
	--		name = "gruvbox",
	--		config = function()
	--			require("gruvbox").setup({})
	--			vim.cmd("colorscheme gruvbox")
	--			ColorMyPencils("gruvbox")
	--		end,
	--	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox-material")
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_transparent_background = "2"
			ColorMyPencils("gruvbox-material")
		end,
	},
	--	{
	--		"rebelot/kanagawa.nvim",
	--		name = "kanagawa",
	--		config = function()
	--			require("kanagawa").setup({
	--				theme = "dragon",
	--				force_reverse_video_cursor = true,
	--				colors = {
	--					foreground = "#dcd7ba",
	--					background = "#1f1f28",
	--
	--					cursor_bg = "#c8c093",
	--					cursor_fg = "#c8c093",
	--					cursor_border = "#c8c093",
	--
	--					selection_fg = "#c8c093",
	--					selection_bg = "#2d4f67",
	--
	--					scrollbar_thumb = "#16161d",
	--					split = "#16161d",
	--
	--					ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	--					brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	--					indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
	--				},
	--			})
	--			ColorMyPencils("kanagawa")
	--		end,
	--	},
	--{
	--	"catppuccin/nvim",
	--	name = "catppuccin",
	--	priority = 1000,
	--	config = function()
	--		require("catppuccin").setup({
	--			flavour = "macchiato",
	--			transparent_background = true,
	--		})

	--		ColorMyPencils("catppuccin")
	--	end,
	--},
}
