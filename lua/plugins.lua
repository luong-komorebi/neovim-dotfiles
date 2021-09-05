return {
  -- Theme and icons
  -- ======================
  { "wbthomason/packer.nvim" },
  { "folke/tokyonight.nvim" },
  { "ryanoasis/vim-devicons" },
  { "kyazdani42/nvim-web-devicons" },

  -- jumping around
  -- ======================
  {
    "phaazon/hop.nvim",
    as = "hop",
    config = [[require"luong.hop"]],
  },
  {
    "easymotion/vim-easymotion",
    config = [[require'luong.easymotion']],
  },

  -- text searching, fuzzy search, file searching
  -- ======================
  { "haya14busa/incsearch.vim" },
  { "haya14busa/incsearch-easymotion.vim" },
  { "haya14busa/incsearch-fuzzy.vim" },
  { "jesseleite/vim-agriculture" },
  {
    "junegunn/fzf.vim",
    requires = { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
  }, -- telescope is only used for some special operations. Fzf is more performant
  {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = [[require"luong.telescope"]],
  },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  { "nelstrom/vim-visual-star-search" },

  -- Editing and formatting codes  -- ======================
  { "matze/vim-move" },
  {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = [[require"luong.nvim-comment"]],
  },
  { "junegunn/vim-easy-align" },
  {
    "windwp/nvim-autopairs",
    config = [[require"luong.autopairs"]],
    after = "nvim-compe",
  },
  { "mg979/vim-visual-multi", branch = "master", config = [[require"luong.vim-visual-multi"]] },
  { "AndrewRadev/splitjoin.vim" },
  { "dyng/ctrlsf.vim" },
  {
    "unblevable/quick-scope",
    config = function()
      require "luong.quickscope"
    end,
  },
  { "junegunn/vim-peekaboo" },
  { "ludovicchabant/vim-gutentags" },
  { "mbbill/undotree" },

  -- Additional text object
  -- ======================
  { "wellle/targets.vim" },
  { "michaeljsmith/vim-indent-object" }, -- File and other Explorer  -- ======================
  {
    "ms-jpq/chadtree",
    branch = "chad",
    config = [[require"luong.chadtree"]],
    run = "python3 -m chadtree deps",
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("luong.which-key").config()
      require("luong.which-key").setup()
    end,
    event = "BufWinEnter",
  },

  -- Indicators  -- ======================
  {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    event = "BufRead",
    config = [[require"luong.gitsigns"]],
  },
  {
    "glepnir/galaxyline.nvim",
    config = [[require"luong.galaxyline"]],
  },
  {
    "akinsho/bufferline.nvim",
    config = [[require"luong.bufferline"]],
    event = "BufWinEnter",
  },

  -- Passive support  -- ======================
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("luong.colorizer").config()
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup()
    end,
  },
  { "ntpeters/vim-better-whitespace", config = [[require"luong.better-whitespace"]] },
  { "lukas-reineke/indent-blankline.nvim", config = [[require"luong.blankline"]] },
  {"preservim/vimux"},
  { -- ,to replace tagbar
    "liuchengxu/vista.vim",
    event = "BufWinEnter",
  },
  { "jeetsukumaran/vim-indentwise" },
  { "andymass/vim-matchup", event = "CursorMoved" },
  { -- rainbow parentheses
    "p00f/nvim-ts-rainbow",
    config = [[require"luong.nvim-ts-rainbow"]],
    event = "BufWinEnter",
  },

  -- Testing and autocomplete
  -- ================================
  { "vim-test/vim-test" },
  { "editorconfig/editorconfig-vim" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
  },
  { "simrat39/symbols-outline.nvim", event = "BufWinEnter" },
  {
    "glepnir/lspsaga.nvim",
    config = [[require"luong.lspsaga"]],
  },
  { -- ,lsp utils when saga is not available
    "RishabhRD/nvim-lsputils", -- a lot of sensible configs for lsp
    requires = "RishabhRD/popfix",
    config = function()
      vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
      vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
      vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
      vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
      vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
      vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
      vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
      vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
    end,
  },
  {
    "kabouzeid/nvim-lspinstall", -- auto install lsp servers
    event = "VimEnter",
    config = [[require"luong.lspinstall"]],
  },

  -- Debugging
  -- ======================
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("luong.nvim-dap").setup()
    end,
  },
  {
    "Pocco81/DAPInstall.nvim",
    config = function()
      require("dap-install").setup {
        installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
        verbosely_call_debuggers = false,
      }
    end,
  },
  -- Formatter and linter
  -- ======================
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Completion and snippet
  -- ======================
  {
    "hrsh7th/nvim-compe",
    config = [[require"luong.nvim-compe"]],
  },
  {
    "hrsh7th/vim-vsnip-integ",
    requires = { "hrsh7th/vim-vsnip", event = "InsertEnter" },
  },
  { "rafamadriz/friendly-snippets", event = "InsertCharPre" },

  -- Git tools
  -- ======================
  {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require"luong.gitlinker"]],
  },
  {
    "pwntester/octo.nvim",
    event = "BufRead",
    config = function()
      require("octo").setup()
    end,
  },

  -- Terminal
  -- ======================
  {
    "akinsho/nvim-toggleterm.lua",
    event = "BufWinEnter",
    config = function()
      require("luong.nvim-toggleterm").setup()
    end,
  }, -- Miscs  -- ======================
  { "vim-scripts/git-time-lapse" },
  { "ellisonleao/glow.nvim" },
  { "rhysd/git-messenger.vim" },
  {
    "sindrets/diffview.nvim",
    config = [[require"luong.diffview"]],
  },

  -- Syntax and language packs
  -- =========================
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
    config = [[require"luong.nvim-treesitter"]],
  },
  -- markdown
  {
    "gabrielelana/vim-markdown",
    config = function()
      vim.g.markdown_enable_mappings = false
    end,
  },
  -- yard
  {
    "noprompt/vim-yardoc",
    config = function()
      local execute = vim.api.nvim_command
      execute "hi link yardGenericTag rubyInstanceVariable"
    end,
  },
  -- yaml
  { "towolf/vim-helm" },
  { "pedrohdz/vim-yaml-folds" },
  -- rego
  { "tsandall/vim-rego" },
  -- terraform
  { "hashivim/vim-terraform" },
  { "sbdchd/neoformat" }, -- Currently ALE does not support fix rego so we have to ,neoformat
  -- jsonnet
  { "google/vim-jsonnet" },
  -- latex
  {
    "lervag/vimtex",
    ft = {"tex"},
  },

  -- Tpope and his ruby magics  -- =========================
  { "tpope/vim-cucumber" },
  { "tpope/vim-surround" },
  { "tpope/vim-projectionist" },
  { "junegunn/gv.vim" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-rake" },
  { "tpope/vim-bundler" },
}
