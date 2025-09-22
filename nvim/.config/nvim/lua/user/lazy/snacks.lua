-- function close_miniexs()
-- 	MiniFiles.close()
-- end

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {},
		terminal = {},
	},
	keys = {
		{
			"<leader>pf",
			function()
				-- close_miniexs()
				Snacks.picker.smart()
			end,
			desc = "Buffers",
		},
		{
			"<leader>en",
			function()
				-- close_miniexs()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				-- close_miniexs()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				-- close_miniexs()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				-- close_miniexs()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>pws",
			function()
				-- close_miniexs()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>/",
			function()
				-- close_miniexs()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>vh",
			function()
				-- close_miniexs()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"gd",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ls",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>lws",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>lg",
			function()
				-- close_miniexs()
				Snacks.lazygit()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>ee",
			function()
				-- close_miniexs()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>gc",
			function()
				-- close_miniexs()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gs",
			function()
				-- close_miniexs()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"gI",
			function()
				-- close_miniexs()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},

		-- {
		-- 	"<leader>tt",
		-- 	function()
		-- 		-- close_miniexs()
		-- 		Snacks.terminal.toggle()
		-- 	end,
		-- 	desc = "LSP Workspace Symbols",
		-- },
	},
}
