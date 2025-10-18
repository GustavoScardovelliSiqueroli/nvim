return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      vue = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      c = { "clang_format" },
    },
  },
}
