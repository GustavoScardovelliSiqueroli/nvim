return {
  -- FORMATADOR
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "ruff_format" },
      },
    },
  },
}
