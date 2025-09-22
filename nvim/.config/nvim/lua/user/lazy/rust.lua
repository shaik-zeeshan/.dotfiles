return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")
			rt.setup({
				server = {
					on_attach = function(client, bufnr)
						if client.supports_method("textDocument/formatting") then
							vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = augroup,
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format({ bufnr = bufnr })
								end,
							})
						end
					end,
				},
			})
		end,
	},
	-- {
	--   'mrcjkb/rustaceanvim',
	--   version = '^6', -- Recommended
	--   lazy = false,   -- This plugin is already lazy
	--   config = function ()
	--     vim.g.rustaceanvim = {
	--       -- Plugin configuration
	--       -- tools = {},
	--       -- LSP configuration
	--       server = {
	--         on_attach = function(client, bufnr)
	--           -- you can also put keymaps in here
	--           vim.lsp.inlay_hint.enable(true)
	--         end,
	--         --     settings = {
	--         --       -- rust-analyzer language server configuration
	--         --       ["rust-analyzer"] = {},
	--         --     },
	--         --   },
	--         --   -- DAP configuration
	--         --   dap = {},
	--       },
	--     }
	--   end
	-- }
}
