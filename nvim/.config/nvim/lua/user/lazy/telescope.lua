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
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", function()
				builtin.find_files({
					find_command = { "fd", "--type", "f", "--hidden", "--follow" },
				})
			end, {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

			vim.keymap.set("n", "<leader>ee", builtin.diagnostics, {})
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>gfs", builtin.git_status, {})
			vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, {})

			require("telescope").load_extension("fzf")
		end,
	},
}
