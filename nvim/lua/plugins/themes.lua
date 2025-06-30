return {

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  }
  , {
  "shaunsingh/nord.nvim",
  priority = 1000,
  config = function()
  end,
},
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,

    config = function()
    end,
  }
  , {


  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
  end,

},
  {
    "marko-cerovac/material.nvim",
    priority = 1000,
    config = function()
      vim.g.material_style = "darker" -- أو "palenight", "deep ocean", ...
    end,

  }
  , {
  "Tsuzat/NeoSolarized.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {

    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
  },
}

, {
  "sainnhe/edge",
  priority = 1000,
  opts = {

    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
  },
  config = function()
    vim.g.edge_style = "aura" -- أو "neon", "default"
  end,
},
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = true,
      })
    end,
  }
  ,
  {
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard' -- soft, medium, hard
    end,

    opts = {

      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    },
  }
  , {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  opts = {

    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
  },
  lazy = false,
  priority = 1000,
  config = function()
    local palettes = {
      github_dark_default = {
        red = '#ff0000',
      },
      github_light = {
        comment = '#636e7b',
      },
    }
    local specs = {
      github_dark_default = {
        syntax = {
        }
      }
    }

    local groups = {
      all = {
        IncSearch = { bg = 'palette.cyan' },
      },
    }
    require("github-theme").setup({
      groups = groups,
      palettes = palettes,
      specs = specs

    })
  end

}
}
