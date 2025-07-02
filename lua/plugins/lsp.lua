return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Corrigir encoding e ativar diagnósticos globais
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { "utf-8" }

      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              exclude = { "**/migrations", "**/tests", "**/__pycache__", "**/.venv" },
              typeCheckingMode = "strict",
              diagnosticMode = "workspace", -- mostra problemas em todos os arquivos
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
      })
    end,
  },
}
