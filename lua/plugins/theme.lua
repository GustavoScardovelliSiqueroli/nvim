return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    })
    vim.cmd("colorscheme carbonfox") -- ou "nightfox" | "carbonfox" #7aa2f7
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
