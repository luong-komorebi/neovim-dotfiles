local execute = vim.api.nvim_command
local packer = require "packer"

packer.init {
  max_jobs = 20,
}
packer.startup(function(use)
  use "wbthomason/packer.nvim"
  -- Theme and icons
  -- ======================
  use "folke/tokyonight.nvim"
  use "ryanoasis/vim-devicons"
  use "kyazdani42/nvim-web-devicons"

  -- jumping around
  -- ======================
  use {
    "phaazon/hop.nvim",
    as = "hop",
    config = [[require"luong.config.hop"]],
  }
  use {
    "easymotion/vim-easymotion",
    config = [[require'luong.config.easymotion']],
  }

  -- text searching, fuzzy search, file searching
  -- ======================
  use "haya14busa/incsearch.vim"
  use "haya14busa/incsearch-easymotion.vim"
  use "haya14busa/incsearch-fuzzy.vim"
  use "jesseleite/vim-agriculture"
  use {
    "junegunn/fzf.vim",
    requires = { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
  }
  -- telescope is only used for some special operations. Fzf is more performant
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = [[require"luong.config.telescope"]],
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nelstrom/vim-visual-star-search"

  -- Editing and formatting codes
  -- ======================
  use "matze/vim-move"
  use {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = [[require"luong.config.nvim-comment"]],
  }
  use "junegunn/vim-easy-align"
  use {
    "windwp/nvim-autopairs",
    config = [[require"luong.config.autopairs"]],
    after = "nvim-compe",
  }
  use { "mg979/vim-visual-multi", branch = "master" }
  use "AndrewRadev/splitjoin.vim"
  use "dyng/ctrlsf.vim"
  use "rhysd/clever-f.vim"
  use "junegunn/vim-peekaboo"
  use "ludovicchabant/vim-gutentags"
  use "mbbill/undotree"

  -- Additional text object
  -- ======================
  use "wellle/targets.vim"
  use "michaeljsmith/vim-indent-object"

  -- File and other Explorer
  -- ======================
  use {
    "ms-jpq/chadtree",
    branch = "chad",
    run = "python3 -m chadtree deps",
  }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("luong.config.which-key").setup()
    end,
    event = "BufWinEnter",
  }

  -- Indicators
  -- ======================
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = [[require"luong.config.gitsigns"]],
  }
  use {
    "glepnir/galaxyline.nvim",
    config = [[require"luong.config.galaxyline"]],
  }

  use {
    "akinsho/bufferline.nvim",
    config = [[require"luong.config.bufferline"]],
    event = "BufWinEnter",
  }

  -- Passive support
  -- ======================
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  }
  use { "ntpeters/vim-better-whitespace", config = [[require"luong.config.better-whitespace"]] }
  use "lukas-reineke/indent-blankline.nvim"
  use "benmills/vimux"
  use "liuchengxu/vista.vim"
  use "jeetsukumaran/vim-indentwise"
  use "andymass/vim-matchup"
  use { -- rainbow parentheses
    "p00f/nvim-ts-rainbow",
    config = [[require"luong.config.nvim-ts-rainbow"]],
    event = "BufWinEnter",
  }
  -- Autoload load nvim plugins config
  use "tjdevries/astronauta.nvim"

  -- Testing and autocomplete
  -- ================================
  use "janko-m/vim-test"
  use "editorconfig/editorconfig-vim"
  -- LSP
  use "neovim/nvim-lspconfig"
  use {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("user.lsp_signature").config()
    end,
  }

  use {
    "glepnir/lspsaga.nvim",
    config = [[require"luong.config.lspsaga"]],
  }
  use { -- use lsp utils when saga is not available
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
  }
  use {
    "kabouzeid/nvim-lspinstall", -- auto install lsp servers
    event = "VimEnter",
    config = [[require"luong.config.lspinstall"]],
  }

  -- Debugging
  -- ======================
  use {
    "mfussenegger/nvim-dap",
    config = [[require"luong.config.nvim-dap"]],
  }
  use {
    "Pocco81/DAPInstall.nvim",
  }

  -- Formatter and linter
  -- ======================
  use "jose-elias-alvarez/null-ls.nvim"

  -- Completion and snippet
  -- ======================
  use {
    "hrsh7th/nvim-compe",
    config = [[require"luong.config.nvim-compe"]],
  }
  use {
    "hrsh7th/vim-vsnip-integ",
    requires = { "hrsh7th/vim-vsnip", event = "InsertCharPre" },
  }
  use { "rafamadriz/friendly-snippets", event = "InsertCharPre" }

  -- Git tools
  -- ======================
  use {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require"luong.config.gitlinker"]],
  }
  use {
    "pwntester/octo.nvim",
    event = "BufRead",
    config = function()
      require("luong.config.octo").config()
    end,
  }

  -- Terminal
  -- ======================
  use {
    "akinsho/nvim-toggleterm.lua",
    event = "BufWinEnter",
    config = function()
      require("luong.config.nvim-toggleterm").setup()
    end,
  }

  -- Miscs
  -- ======================
  use "vim-scripts/git-time-lapse"
  use { "npxbr/glow.nvim", run = "GlowInstall" }
  use "rhysd/git-messenger.vim"

  use {
    "sindrets/diffview.nvim",
    config = [[require"luong.config.diffview"]],
  }

  -- Syntax and language packs
  -- =========================
  -- https://github.com/sheerun/vim-polyglot/issues/309
  -- have to load vim go before vim polygot
  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
    config = [[require"luong.config.nvim-treesitter"]],
  }

  -- markdown
  use "gabrielelana/vim-markdown"
  vim.g.markdown_enable_mappings = false

  -- yard
  use "noprompt/vim-yardoc"
  execute "hi link yardGenericTag rubyInstanceVariable"

  -- yaml
  use "towolf/vim-helm"
  use "pedrohdz/vim-yaml-folds"

  -- rego
  use "tsandall/vim-rego"

  -- terraform
  use "hashivim/vim-terraform"
  use "sbdchd/neoformat" -- Currently ALE does not support fix rego so we have to use neoformat

  -- jsonnet
  use "google/vim-jsonnet"

  -- latex
  use {
    "lervag/vimtex",
    ft = "tex",
  }

  -- Rust tools
  -- TODO: use lazy loading maybe?
  use { "simrat39/rust-tools.nvim" }

  -- Elixir
  use { "elixir-editors/vim-elixir", ft = { "elixir", "eelixir", "euphoria3" } }

  -- Javascript / Typescript
  use {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  }

  -- Tpope and his ruby magics
  -- =========================
  use "tpope/vim-cucumber"
  use "tpope/vim-surround"
  use "tpope/vim-projectionist"
  use "junegunn/gv.vim"
  use "tpope/vim-rhubarb"
  use "tpope/vim-rake"
  use "tpope/vim-bundler"
end)
