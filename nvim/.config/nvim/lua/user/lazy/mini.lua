local pwd = vim.fn.getcwd()
return {
	"echasnovski/mini.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	version = "*",
	config = function()
		local spec_treesitter = require("mini.ai").gen_spec.treesitter
		require("mini.ai").setup({
			custom_textobjects = {
				F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
				o = spec_treesitter({
					a = { "@conditional.outer", "@loop.outer" },
					i = { "@conditional.inner", "@loop.inner" },
				}),
			},
		})

		require("mini.files").setup({ mappings = { go_out = "" } })
		-- -- Make `go_out` to not go outside of initial path (a.k.a. "anchor")
		local go_out_restricted = function()
			local state = MiniFiles.get_explorer_state()
			local cur_win_id = vim.api.nvim_get_current_win()
			local cur_win = state.target_window
			local cur_win_path = nil
			for _, win_data in ipairs(state.windows) do
				if win_data.win_id == cur_win_id then
					cur_win_path = win_data.path
				end
			end
			-- print(cur_win, cur_win_path, pwd)
			if pwd == cur_win_path then
				return print("Cannot navigate outside the initial directory.", pwd, state.anchor)
			end
			MiniFiles.go_out()
		end

		local map_go_out = function(args)
			local rhs = function()
				for _ = 1, vim.v.count1 do
					go_out_restricted()
				end
			end
			vim.keymap.set("n", "h", rhs, { buffer = args.data.buf_id })
		end
		vim.api.nvim_create_autocmd("User", { pattern = "MiniFilesBufferCreate", callback = map_go_out })

		local group = vim.api.nvim_create_augroup("mini.files", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			desc = "define commands/keymaps for mini.files",
			group = group,
			callback = function(args)
				local buf_id = args.data.buf_id
				vim.api.nvim_create_autocmd("BufLeave", {
					group = group,
					buffer = buf_id,
					callback = function()
						vim.api.nvim_create_autocmd("BufEnter", {
							group = group,
							once = true,
							callback = function()
								if vim.bo.filetype ~= "minifiles" then
									vim.api.nvim_buf_call(buf_id, require("mini.files").close)
								end
							end,
						})
					end,
				})
			end,
		})
	end,
}
