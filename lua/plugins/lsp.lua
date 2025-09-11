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
              typeCheckingMode = "strict",
              diagnosticMode = "workspace", -- mostra problemas em todos os arquivos
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "love" }, -- pra que o linter não reclame de "love" como global desconhecido
            },
            workspace = {
              library = {
                -- incluir as definições do Love2D
                -- local onde o plugin love2d.nvim guarda essas definições ou usar o caminho padrão
              },
            },
            telemetry = { enable = false },
          },
        },
      })
    end,
  },
}
