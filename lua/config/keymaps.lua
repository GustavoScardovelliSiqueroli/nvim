-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<A-w>", ":bd<CR>")
vim.keymap.set("n", "<A-s>", ":w<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Ir para definição" })
