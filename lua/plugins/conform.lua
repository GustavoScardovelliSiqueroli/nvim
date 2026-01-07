return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      vue = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      gdscript = { "gdscriptformatter", stop_after_first = true },
    },
    formatters = {
      gdscriptformatter = {
        command = "gdscript-formatter",
        args = { "--safe" },
        stdin = true,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
