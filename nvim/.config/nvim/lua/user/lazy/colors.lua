function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
--    {
--        "folke/tokyonight.nvim",
--        name = "tokyonight",
--        config = function()
--            require("tokyonight").setup({
--                -- your configuration comes here
--                -- or leave it empty to use the default settings
--                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--                styles = {
--                    -- Style to be applied to different syntax groups
--                    -- Value is any valid attr-list value for `:help nvim_set_hl`
--                    comments = { italic = false },
--                    keywords = { italic = false },
--                    -- Background styles. Can be "dark", "transparent" or "normal"
--                    sidebars = "dark", -- style for sidebars, see below
--                    floats = "dark", -- style for floating windows
--                },
--            })
--            ColorMyPencils()
--        end
--    },
--
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

    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
            })
            vim.cmd("colorscheme gruvbox")
            ColorMyPencils()
        end
    }
}
