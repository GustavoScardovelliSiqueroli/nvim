return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-python"),
      },
    })

    local wk = require("which-key")

    wk.add({
      { "<leader>pt", group = "Tests" },
    })

    vim.keymap.set("n", "<leader>ptt", function()
      require("neotest").run.run(vim.loop.cwd())
    end, { desc = "Run all project tests" })

    vim.keymap.set("n", "<leader>ptf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run current file tests" })

    vim.keymap.set("n", "<leader>pts", function()
      neotest.summary.toggle()
    end, { desc = "Open test summary" })

    vim.keymap.set("n", "<leader>pto", function()
      neotest.output.open({ enter = true })
    end, { desc = "Open test output" })
  end,
}
