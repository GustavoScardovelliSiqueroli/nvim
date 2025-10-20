return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
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
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {},

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },
      })
    end,
  },
}
