return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "jonarrien/telescope-cmdline.nvim",
    },
    keys = {
      { "<leader><leader>", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
    },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.nvimtreesitter",
  },

  --linters, formatters, etc
  {
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = require("configs.rustaceanvim").on_attach,
        },
        dap = require("configs.rustaceanvim").dap(),
      }
    end,
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- Debug Adapter Protocol client
  {
    "mfussenegger/nvim-dap",
    config = require("configs.nvimdap").config,
  },

  -- IO for nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = require("configs.nvimdapui").config,
  },

  -- An extension for nvim-dap providing default configurations for python and methods to debug individual test methods or classes
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    lazy = false,
    config = function()
      require("dap-python").setup "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").test_runner = "pytest"
    end,
  },

  -- A library for asynchronous IO in Neovim
  {
    "nvim-neotest/nvim-nio",
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      require("copilot").setup()
    end,
  },

  {
    "folke/zen-mode.nvim",
    lazy = false,
  },

  {
    "tris203/precognition.nvim",
    lazy = false,
  },

  {
    "numToStr/Comment.nvim",
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    lazy = false,
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("octo").setup {
        enable_builtin = true,
        suppress_missing_scope = {
          projects_v2 = true,
        },
      }
    end,
    keys = {
      { "<leader>O", "<cmd>Octo<cr>", desc = "Octo" },
    },
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup {}
    end,
  },

  { "MunifTanjim/nui.nvim" },

  { "sindrets/diffview.nvim", lazy = false },

  { "folke/todo-comments.nvim", lazy = false },

  { "nvim-pack/nvim-spectre", lazy = false },

  { "nvim-treesitter/nvim-treesitter-context", lazy = false },

  {
    "hedyhli/outline.nvim",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
      require("outline").setup {}
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.harpoon").setup()
    end,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = require("configs.avante").opts,
    build = "make",
    dependencies = require("configs.avante").dependencies,
  },

  { "akinsho/git-conflict.nvim", version = "*", config = true, lazy = false },

  {
    "atiladefreitas/dooing",
    lazy = false,
  },
}
