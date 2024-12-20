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
				null_ls.builtins.formatting.shfmt.with({
					method = null_ls.methods.FORMATTING,
				}),
				null_ls.builtins.formatting.gofmt.with({
					method = null_ls.methods.FORMATTING,
				}),
				require("none-ls.diagnostics.eslint_d").with({
					method = null_ls.methods.DIAGNOSTICS,
					condition = function(utils)
						return utils.root_has_file({
							"eslint.json",
							".eslintrc",
							".eslintrc.js",
							".eslintrc.json",
							".eslintrc.yaml",
							".eslintrc.yml",
						})
					end,
				}),
				null_ls.builtins.formatting.prettierd.with({
					method = null_ls.methods.FORMATTING,
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

		local templ_fmt = {
			method = null_ls.methods.FORMATTING,
			filetypes = { "templ", "html" },
			generator = {
				fn = function(params)
					local bufnr = vim.api.nvim_get_current_buf()
					local filename = vim.api.nvim_buf_get_name(bufnr)
					local cmd = "templ fmt " .. vim.fn.shellescape(filename)

					vim.fn.jobstart(cmd, {
						on_exit = function()
							-- Reload the buffer only if it's still the current buffer
							if vim.api.nvim_get_current_buf() == bufnr then
								vim.cmd("e!")
							end
						end,
					})
				end,
			},
		}

		null_ls.register(templ_fmt)

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
