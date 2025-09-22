return {
	{
		"nvim-telescope/telescope.nvim",

		tag = "0.1.5",

		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "%.git/", "node_modules/" },
					prompt_prefix = "❯ ",
					selection_caret = "❯ ",
				},
				pickers = {
					theme = "ivy",
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						case_mode = "smart_case",
					},
				},
			})

			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local conf = require("telescope.config").values
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			local builtin = require("telescope.builtin")

			local monorepo_search = function()
				if vim.fn.filereadable("turbo.json") == 1 then
					-- check the apps and packages folder
					local apps = vim.fn.glob("apps/*", true, true)
					local packages = vim.fn.glob("packages/*", true, true)
					local folders = { "global" }

					for _, app in ipairs(apps) do
						table.insert(folders, app)
					end

					for _, package in ipairs(packages) do
						table.insert(folders, package)
					end

					local package_selector = function(opts)
						opts = opts or {}
						pickers
							.new(opts, {
								theme = "ivy",
								prompt_title = "Select Package",
								finder = finders.new_table({
									results = folders,
								}),
								sorter = conf.generic_sorter(opts),
								attach_mappings = function(prompt_bufnr)
									actions.select_default:replace(function()
										local selection = action_state.get_selected_entry()
										actions.close(prompt_bufnr)
										if selection.value == "global" then
											builtin.find_files({
												find_command = { "fd", "--type", "f", "--hidden", "--follow" },
											})
										else
											builtin.find_files({
												find_command = {
													"fd",
													".",
													selection[1],
													"--type",
													"f",
													"--hidden",
													"--follow",
												},
											})
										end
									end)

									return true
								end,
							})
							:find()
					end

					package_selector()
				else
					builtin.find_files({
						find_command = { "fd", "--type", "f", "--hidden", "--follow" },
					})
				end
			end

			--	vim.keymap.set("n", "<leader>pf", function()
			--		require("mini.files").close()
			--		builtin.find_files({
			--			find_command = { "fd", "--type", "f", "--hidden", "--follow" },
			--		})
			--	end, {})

			-- vim.keymap.set("n", "<leader>en", function()
			-- 	builtin.find_files({
			-- 		cwd = vim.fn.stdpath("config"),
			-- 	})
			-- end)
			-- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			-- vim.keymap.set("n", "<leader>pws", function()
			-- 	local word = vim.fn.expand("<cword>")
			-- 	builtin.grep_string({ search = word })
			-- end)
			-- vim.keymap.set("n", "<leader>pWs", function()
			-- 	local word = vim.fn.expand("<cWORD>")
			-- 	builtin.grep_string({ search = word })
			-- end)
			-- vim.keymap.set("n", "<leader>ps", function()
			-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
			-- end)
			-- vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

			-- vim.keymap.set("n", "<leader>ee", builtin.diagnostics, {})
			-- vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			-- vim.keymap.set("n", "<leader>gfs", builtin.git_status, {})
			-- vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
			--vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
			--vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
			-- vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {})
			-- vim.keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, {})

			require("telescope").load_extension("fzf")
		end,
	},
}
