-- bootstrap lazy.nvim, LazyVim and your plugins

vim.g.snacks_loaded = 1
require("config.lazy")

-- se Snacks for carregado pelo LazyVim, desative assim:

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
