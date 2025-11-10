return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"vtsls",
			},
			automatic_installation = true,
			handlers = {
				["rust_analyzer"] = function()
					vim.lsp.config("rust_analyzer", {
						capabilities = capabilities,
						settings = {
							["rust-analyzer"] = {
								check = {
									command = "clippy",
								},
								diagnostics = {
									enable = true,
								},
							},
						},
					})
					vim.lsp.enable("rust_analyzer")
				end,

				["lua_ls"] = function()
					vim.lsp.config("lua_ls", {
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})

					vim.lsp.enable("lua_ls")
				end,
			},
		})

		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
							{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
						},
					},
				},
			},
			root_markers = {
				"tailwind.config.js",
				"tailwind.config.cjs",
				"tailwind.config.ts",
				"postcss.config.js",
				"postcss.config.cjs",
				"postcss.config.ts",
			},
		})
		vim.lsp.enable("tailwindcss")

		vim.lsp.config("vtsls", {
			capabilities = capabilities,
			root_markers = { "package.json" },
			single_file_support = false,
			complete_function_calls = true,
			settings = {
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					preferences = {
						importModuleSpecifier = "non-relative",
					},
					suggest = {
						completeFunctionCalls = true,
					},
					inlayHints = {
						enumMemberValues = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						parameterNames = { enabled = "literals" },
						parameterTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						variableTypes = { enabled = false },
					},
				},
				vtsls = {
					enableMoveToFileCodeAction = true,
					autoUseWorkspaceTsdk = true,
					experimental = {
						maxInlayHintLength = 30,
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
					tsserver = {
						globalPlugins = {
							{
								name = "@mdx-js/typescript-plugin",
								enableForWorkspaceTypeScriptVersions = true,
								languages = {
									"mdx",
								},
							},
						},
					},
				},
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				-- "markdown",
				-- "mdx", -- <- Start TS server when you open a .mdx file
			},
		})

		vim.lsp.enable("vtsls")
		-- lspconfig.denols.setup({
		-- 	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		-- 	capabilities = capabilities,
		-- })

		vim.lsp.config("mdx_analzyer", {
			typescript = {
				enabled = true,
			},
			capabilities = capabilities,
			filetypes = { "markdown", "mdx" },
		})
		vim.lsp.enable("mdx_analzyer")

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		-- vim.diagnostic.config({
		-- 	-- update_in_insert = true,
		-- 	virtual_text = true,
		-- 	virtual_line = true,
		-- 	float = {
		-- 		focusable = false,
		-- 		style = "minimal",
		-- 		source = "always",
		-- 		header = "",
		-- 		prefix = "",
		-- 	},
		-- })
		vim.diagnostic.config({
			-- virtual_lines = true,
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarningMsg",
				},
			},
		})
	end,
}
