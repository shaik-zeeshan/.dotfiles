function close_miniex()
	MiniFiles.close()
end

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
				close_miniex()
				Snacks.picker.smart()
			end,
			desc = "Buffers",
		},
		{
			"<leader>en",
			function()
				close_miniex()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				close_miniex()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				close_miniex()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				close_miniex()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				close_miniex()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>pws",
			function()
				close_miniex()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>/",
			function()
				close_miniex()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>vh",
			function()
				close_miniex()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"gd",
			function()
				close_miniex()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				close_miniex()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				close_miniex()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				close_miniex()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				close_miniex()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ls",
			function()
				close_miniex()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>lws",
			function()
				close_miniex()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>lg",
			function()
				close_miniex()
				Snacks.lazygit()
			end,
			desc = "LSP Workspace Symbols",
		},
		-- {
		-- 	"<leader>tt",
		-- 	function()
		-- 		close_miniex()
		-- 		Snacks.terminal.toggle()
		-- 	end,
		-- 	desc = "LSP Workspace Symbols",
		-- },
	},
}
