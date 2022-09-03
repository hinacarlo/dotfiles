local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- LSP Saga

saga.init_lsp_saga()

local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
keymap("n", "<C-l>", ":Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "<C-h>", ":Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "K", "::Lspsaga hover_doc<CR>", opts)
keymap("n", "gh", ":Lspsaga lsp_finder<CR>", opts)
keymap("n", "gr", ":Lspsaga rename<CR>", opts)
keymap("n", "ca", ":Lspsaga code_action<CR>", opts)
