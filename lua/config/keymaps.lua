-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<A-w>", ":bd<CR>")
vim.keymap.set("n", "<A-s>", ":w<CR>")
vim.keymap.set(
  "n",
  "gd",
  vim.lsp.buf.definition,
  { desc = "Ir para definição" }
)
vim.keymap.set(
  "n",
  "<leader>e",
  ":NvimTreeToggle<CR>",
  { noremap = true, silent = true, desc = "Toggle Explorer" }
)

vim.keymap.set("n", "<C-/>", function()
  require("snacks").terminal(nil, {
    win = {
      position = "right",
      width = 80,
    },
  })
end, { desc = "Terminal (Root Dir) Vertical" })

vim.keymap.set({ "n", "v" }, "<C-a>", "^")
vim.keymap.set({ "n", "v" }, "<C-e>", "$")
vim.keymap.set("i", "<C-a>", "<C-o>^")
vim.keymap.set("i", "<C-e>", "<C-o>$")
vim.keymap.set("i", "<C-d>", "<Del>")

vim.keymap.set("i", "<C-l>", "<C-o>l")
vim.keymap.set("i", "<C-h>", "<C-o>h")
vim.keymap.set("i", "<C-k>", "<C-o>k")
vim.keymap.set("i", "<C-j>", "<C-o>j")
