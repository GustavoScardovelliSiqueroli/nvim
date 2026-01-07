return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  build = function()
    local TS = require("nvim-treesitter")
    if not TS.get_installed then
      LazyVim.error(
        "Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch."
      )
      return
    end
    package.loaded["lazyvim.util.treesitter"] = nil
    LazyVim.treesitter.build(function()
      TS.update(nil, { summary = true })
    end)
  end,
  event = { "LazyFile", "VeryLazy" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts_extend = { "ensure_installed" },
  opts = {
    indent = { enable = true }, ---@type lazyvim.TSFeat
    highlight = { enable = true }, ---@type lazyvim.TSFeat
    folds = { enable = true }, ---@type lazyvim.TSFeat
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "python",
      "lua",
      "bash",
      "json",
      "javascript",
      "typescript",
      "html",
      "css",
      "vue",
      "c",
      "cpp",
      "yaml",
      "gdscript",
    },
  },
}
