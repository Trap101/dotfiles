local overrides = require "custom.configs.overrides"
---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "gelguy/wilder.nvim",
    dependencies = {
      {
        "romgrk/fzy-lua-native",
      },
      {
        "nixprime/cpsm",
      },
      {
        "sharkdp/fd",
      },
    },
    config = function()
      require "custom.configs.wilder"
      -- config goes here
    end,
    event = "VeryLazy",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      vim.notify = require "notify"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = {
      {
        "neovim/nvim-lspconfig",
      },
      {
        "williamboman/mason.nvim",
      },
    },
    config = function()
      require "custom.configs.rt"
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    event = "BufReadPost",
    config = function() end,
  },
  {

    "lervag/vimtex",
    ft = "tex",
    config = function()
      require "custom.configs.tex"
    end,
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.todo-comments"
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    lazy = false,
    dependencies = "natecraddock/sessions.nvim",
    config = function()
      require "custom.configs.workspaces"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    dependencies = {
      "NvChad/base46",
      branch = "v2.0",
      build = function()
        require("base46").load_all_highlights()
      end,
    },
    config = function()
      require "custom.configs.transparent"
    end,
  },
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    -- you can specify also another config if you want
    config = function()
      require "custom.configs.gx"
    end,
  },
  {
    "sedm0784/vim-you-autocorrect",
    ft = { "latex", "tex", "markdown", "txt" },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "tsx", "ts", "astro", "vue", "md", "svelte", "jsx" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
      },
      {
        "windwp/nvim-autopairs",
      },
    },
    config = function()
      require "custom.configs.auto-pair-tags"
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    config = function()
      require "custom.configs.folding"
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    version = "^2", -- Recommended
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require "custom.configs.code_runner"
    end,
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event="VeryLazy",
    keys={
      {
        "<leader>q",
        mode="n",
        function()
          require("trouble").toggle("document_diagnostics")
        end,
        desc="toggle trouble",
      }
    }
  
    
  },
}

return plugins
