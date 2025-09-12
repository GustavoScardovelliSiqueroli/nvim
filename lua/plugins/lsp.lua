return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- símbolo antes da mensagem
        },
        signs = true, -- mostra ícones na coluna da esquerda
        underline = true, -- sublinha o erro no código
        update_in_insert = false, -- não mostra erro enquanto digita
        severity_sort = true, -- ordena por severidade
      })
      local signs =
        { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Ignorar diagnósticos em certas pastas
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(
        _,
        result,
        ctx,
        config
      )
        local ignored_dirs = { "tests", "node_modules" }
        local uri = result.uri or ""
        for _, dir in ipairs(ignored_dirs) do
          if uri:find(dir) then
            return -- não publica diagnósticos para essa pasta
          end
        end
        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
      end

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
