return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					method = null_ls.methods.FORMATTING,
				}),
				null_ls.builtins.formatting.black.with({
					method = null_ls.methods.FORMATTING,
				}),
				null_ls.builtins.formatting.isort.with({
					method = null_ls.methods.FORMATTING,
				}),
				null_ls.builtins.formatting.prettierd.with({
					method = null_ls.methods.FORMATTING,
				}),
				null_ls.builtins.formatting.shfmt.with({
					method = null_ls.methods.FORMATTING,
				}),
				null_ls.builtins.formatting.gofmt.with({
					method = null_ls.methods.FORMATTING,
				}),
				require("none-ls.diagnostics.eslint_d").with({
					method = null_ls.methods.DIAGNOSTICS,
					condition = function(utils)
						return utils.root_has_file(
							"eslint.json",
							".eslintrc",
							".eslintrc.js",
							".eslintrc.json",
							".eslintrc.yaml",
							".eslintrc.yml"
						)
					end,
				}),
			},
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
		})

		null_ls.register({
			name = "biome",
			sources = {
				null_ls.builtins.formatting.biome,
			},
			condition = function(utils)
				return utils.root_has_file("biome.json")
			end,
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
