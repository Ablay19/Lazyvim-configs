return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("let g:everforest_background = 'hard'")
    vim.cmd("colorscheme everforest")
  end,
}
