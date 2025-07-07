local pwd = vim.fn.getcwd()
return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()
		require("mini.files").setup({ mappings = { go_out = "" } })
		--
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
	end,
}
