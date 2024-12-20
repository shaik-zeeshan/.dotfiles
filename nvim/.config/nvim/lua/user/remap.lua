vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>dq", 'ciw"<C-r>""<Esc>')
vim.keymap.set("n", "<leader>q", "ciw'<C-r>\"'<Esc>")

vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)

vim.keymap.set("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- This is going to get me cancelled
-- if err != nil {
-- return err
-- }
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>ed", function()
	vim.diagnostic.open_float(0, { scope = "line", border = "single" })
end, {})

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww sessions<CR>")
vim.keymap.set("n", "<C-x>", "<cmd>silent !tmux neww sessions --t<CR>")
vim.keymap.set("n", "<C-_>", "<cmd>silent !tmux neww cht-sh<CR>")
vim.keymap.set("n", "<leader>lg", "<cmd>silent !tmux neww lazygit<CR>")
vim.keymap.set("n", "<leader>fs", "<cmd>silent !tmux neww yazi<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

--vim.keymap.set("n", "<leader><leader>", function()
--	vim.cmd("so")
--end)

-- vim.keymap.set({ "n", "i" }, "<C-q>", "<cmd>silent !tmux splitw  ollama run codegemma<CR>")
vim.keymap.set("n", "<leader>pwd", "<cmd>e `pwd`<CR>")
--vim.api.nvim_create_autocmd("LspAttach", {
--	callback = function()
--		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
--		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
--		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
--	end,
--})
--
--vim.api.nvim_create_autocmd("LspDetach", {
--	callback = function()
--		vim.keymap.del("n", "<leader>gd", vim.lsp.buf.definition)
--		vim.keymap.del("n", "<leader>gr", vim.lsp.buf.references)
--		vim.keymap.del("n", "<leader>gi", vim.lsp.buf.implementation)
--	end,
--})
