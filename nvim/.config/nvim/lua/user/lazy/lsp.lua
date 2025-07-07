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

		local lspconfig = require("lspconfig")

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
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["rust_analyzer"] = function()
					lspconfig.rust_analyzer.setup({
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
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
								hint = {
									enable = true,
								},
								workspace = {
									-- Make the server aware of Neovim runtime files
									library = vim.api.nvim_get_runtime_file("", true),
								},
								-- Do not send telemetry data containing a randomized but unique identifier
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
			},
		})

		lspconfig.tailwindcss.setup({
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
			root_dir = lspconfig.util.root_pattern(
				"tailwind.config.js",
				"tailwind.config.cjs",
				"tailwind.config.ts",
				"postcss.config.js",
				"postcss.config.cjs",
				"postcss.config.ts"
			),
		})

		lspconfig.vtsls.setup({
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("package.json"),
			single_file_support = false,
			complete_function_calls = true,
			settings = {
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
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
				"markdown",
				"mdx", -- <- Start TS server when you open a .mdx file
			},
		})

		--lspconfig.tsserver.setup({
		--	globalPlugins = {
		--		{
		--			name = "@mdx-js/typescript-plugin",
		--			enableForWorkspaceTypeScriptVersions = true,
		--			languages = {
		--				"mdx",
		--			},
		--		},
		--	},
		--	settings = {
		--		typescript = {
		--			inlayHints = {
		--				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
		--				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
		--				includeInlayVariableTypeHints = true,
		--				includeInlayFunctionParameterTypeHints = true,
		--				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
		--				includeInlayPropertyDeclarationTypeHints = true,
		--				includeInlayFunctionLikeReturnTypeHints = true,
		--				includeInlayEnumMemberValueHints = true,
		--			},
		--		},
		--		javascript = {
		--			inlayHints = {
		--				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
		--				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
		--				includeInlayVariableTypeHints = true,

		--				includeInlayFunctionParameterTypeHints = true,
		--				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
		--				includeInlayPropertyDeclarationTypeHints = true,
		--				includeInlayFunctionLikeReturnTypeHints = true,
		--				includeInlayEnumMemberValueHints = true,
		--			},
		--		},
		--	},
		--	inlayHints = {
		--		enable = true,
		--	},
		--	filetypes = {
		--		"javascript",
		--		"javascriptreact",
		--		"javascript.jsx",
		--		"typescript",
		--		"typescriptreact",
		--		"typescript.tsx",
		--		"markdown",
		--		"mdx", -- <- Start TS server when you open a .mdx file
		--	},
		--})

		-- lspconfig.denols.setup({
		-- 	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		-- 	capabilities = capabilities,
		-- })

		lspconfig.mdx_analyzer.setup({
			typescript = {
				enabled = true,
			},
			capabilities = capabilities,
			filetypes = { "markdown", "mdx" },
		})

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

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
