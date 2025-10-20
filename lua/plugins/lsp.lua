return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      local signs =
        { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local default_handler =
        vim.lsp.handlers["textDocument/publishDiagnostics"]

      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(
        err,
        result,
        ctx,
        config
      )
        if not result or not result.uri then
          return
        end
        local ignored_dirs = { "tests", "node_modules" }
        for _, dir in ipairs(ignored_dirs) do
          if result.uri:find(dir) then
            return
          end
        end
        default_handler(err, result, ctx, config)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { "utf-8" }

      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "strict",
              diagnosticMode = "workspace",
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
              globals = { "love" },
            },
            telemetry = { enable = false },
          },
        },
      })

      lspconfig.volar.setup({
        filetypes = {
          "typescript",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "json",
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })
    end,
  },
}
