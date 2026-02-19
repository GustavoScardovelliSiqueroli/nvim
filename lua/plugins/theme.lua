return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
      palettes = {
        carbonfox = {
          bg1 = "#1b1f26",
          -- bg2 = "#15181e",
        },
      },
    })
    vim.cmd("colorscheme carbonfox") -- nightfox" | "carbonfox" #7aa2f7
    vim.cmd([[
      hi CursorLine guibg=#2a3d56 gui=NONE
      hi Visual guibg=#4B76C8 guifg=#7aa2f7
      hi Underlined guifg=#FFD700 gui=underline
      hi DiagnosticUnderlineError guifg=#FF0000 gui=underline
      hi DiagnosticUnderlineWarn  guifg=#FFA500 gui=underline
      hi DiagnosticUnderlineInfo  guifg=#4DB5FF gui=underline
      hi DiagnosticUnderlineHint  guifg=#50FA7B gui=underline
    ]])
  end,
}

-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require("onedark").setup({
--       style = "darker",
--     })
--     -- Enable theme
--     require("onedark").load()
--   end,
-- }
--
-- return {
--   { "morhetz/gruvbox" }, -- o plugin
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }
--
-- return {
--   "projekt0n/github-nvim-theme",
--   name = "github-theme",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require("github-theme").setup({
--       -- ...
--     })
--
--     vim.cmd("colorscheme github_dark_tritanopia")
--   end,
-- }
