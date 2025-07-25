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
              version = "LuaJIT", -- Love2D usa LuaJIT
            },
            diagnostics = {
              globals = { "vim", "love" },
            },
            workspace = {
              library = {
                [vim.fn.stdpath("config") .. "/love-api"] = true, -- love-api baixado
                [vim.fn.expand("$VIMRUNTIME/lua")] = true, -- runtime do neovim
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true, -- LSP builtins
              },
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
  },
}
