return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "numToStr/Comment.nvim" },
  {
    "feline-nvim/feline.nvim",
    config = function()
      local present, feline = pcall(require, "feline")
      if not present then
        return
      end

      -- Customizations {{{
      local theme = {
        aqua = "#7AB0DF",
        bg = "#1C212A",
        blue = "#5FB0FC",
        cyan = "#70C0BA",
        darkred = "#FB7373",
        fg = "#C7C7CA",
        gray = "#222730",
        green = "#79DCAA",
        lime = "#54CED6",
        orange = "#FFD064",
        pink = "#D997C8",
        purple = "#C397D8",
        red = "#F87070",
        yellow = "#FFE59E",
      }

      local mode_theme = {
        ["NORMAL"] = theme.green,
        ["OP"] = theme.cyan,
        ["INSERT"] = theme.aqua,
        ["VISUAL"] = theme.yellow,
        ["LINES"] = theme.darkred,
        ["BLOCK"] = theme.orange,
        ["REPLACE"] = theme.purple,
        ["V-REPLACE"] = theme.pink,
        ["ENTER"] = theme.pink,
        ["MORE"] = theme.pink,
        ["SELECT"] = theme.darkred,
        ["SHELL"] = theme.cyan,
        ["TERM"] = theme.lime,
        ["NONE"] = theme.gray,
        ["COMMAND"] = theme.blue,
      }

      local modes = setmetatable({
        ["n"] = "N",
        ["no"] = "N",
        ["v"] = "V",
        ["V"] = "VL",
        [""] = "VB",
        ["s"] = "S",
        ["S"] = "SL",
        [""] = "SB",
        ["i"] = "I",
        ["ic"] = "I",
        ["R"] = "R",
        ["Rv"] = "VR",
        ["c"] = "C",
        ["cv"] = "EX",
        ["ce"] = "X",
        ["r"] = "P",
        ["rm"] = "M",
        ["r?"] = "C",
        ["!"] = "SH",
        ["t"] = "T",
      }, {
        __index = function()
          return "-"
        end,
      })
      -- }}} customizations

      -- Components {{{ (keep all your component definitions here)
      local component = {}
      -- ... paste all your component definitions here ...
      -- }}} components

      vim.api.nvim_set_hl(0, "StatusLine", { bg = "#101317", fg = "#7AB0DF" })
      feline.setup({
        components = {
          active = {
            {}, -- left
            {}, -- middle
            { -- right
              component.vim_mode,
              component.file_type,
              component.lsp,
              component.git_branch,
              component.git_add,
              component.git_delete,
              component.git_change,
              component.separator,
              component.diagnostic_errors,
              component.diagnostic_warnings,
              component.diagnostic_info,
              component.diagnostic_hints,
              component.scroll_bar,
            },
          },
        },
        theme = theme,
        vi_mode_colors = mode_theme,
      })
    end,
  },
  { "onsails/lspkind.nvim" },
  { "nvim-telescope/telescope-symbols.nvim" },
  { "windwp/nvim-autopairs" },
}
