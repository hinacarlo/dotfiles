vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- do not yank with x
vim.keymap.set("n", "x", '"_x"')

-- vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "x" }, "<leader>p", [["0p]], { desc = "paste from yank register" })

-- yank to clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- vim.keymap.set("n", "<leader>f", function()
--     vim.lsp.buf.format()
-- end)

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Prev Buffer" })

-- code actions
vim.keymap.set("n", "<leader>ca", function()
	vim.lsp.buf.code_actions()
end)

-- toggleterm
vim.api.nvim_set_keymap("n", "<C-z>", '<Cmd>exe "ToggleTerm"<CR>', { noremap = true, silent = true })
