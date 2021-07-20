local execute = vim.api.nvim_command
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])
local packer = require('packer')

packer.init({
    git = {
        clone_timeout = 300, -- 5 mins
    },
    profile = {
        enable = true,
    },
})

packer.startup(function()
  use 'wbthomason/packer.nvim'
  -- Theme and icons
  -- ======================
  use 'folke/tokyonight.nvim'
  use 'ryanoasis/vim-devicons'

  -- ======================
  -- Search and jump around
  --  note : to paste in easymotion search mode: use ctrl-r and + or "
  use {
    'phaazon/hop.nvim', as = 'hop',
    config = [[require"luong.config.hop"]]
  }
  use {
    'easymotion/vim-easymotion',
    config = [[require'luong.config.easymotion']]
  }
  use 'haya14busa/incsearch.vim'
  use 'haya14busa/incsearch-easymotion.vim'
  use 'haya14busa/incsearch-fuzzy.vim'
  use 'jesseleite/vim-agriculture'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
  use 'junegunn/fzf.vim'
  -- use telescope when https://github.com/nvim-telescope/telescope.nvim/pull/987
  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  -- }
  use 'nelstrom/vim-visual-star-search'

  -- Editing and formatting codes
  -- ======================
  use 'matze/vim-move'
  use {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = [[require"luong.config.nvim-comment"]],
  }
  use 'junegunn/vim-easy-align'
  use {'windwp/nvim-autopairs', config = [[require"luong.config.autopairs"]]}
  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'AndrewRadev/splitjoin.vim'
  use 'dyng/ctrlsf.vim'
  use 'rhysd/clever-f.vim'
  use 'junegunn/vim-peekaboo'
  use 'ludovicchabant/vim-gutentags'
  use 'mbbill/undotree'

  -- Additional text object
  -- ======================
  use 'wellle/targets.vim'
  use 'michaeljsmith/vim-indent-object'

  -- Navigations and files
  -- ======================
  use 'psliwka/vim-smoothie'
  -- You will have to run :CHADdeps when installing / updating
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps',
  }

  -- Indicators
  -- ======================
  -- dependencies for gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require"luong.config.gitsigns"]],
  }
  use {
    'glepnir/galaxyline.nvim',
    config = [[require"luong.config.galaxyline"]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require"luong.config.bufferline"]],
  }

  -- Passive support
  -- ======================
  use 'ntpeters/vim-better-whitespace'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'benmills/vimux'
  use 'liuchengxu/vista.vim'
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'jeetsukumaran/vim-indentwise'
  use 'andymass/vim-matchup'
  -- Autoload load nvim plugins config
  use 'tjdevries/astronauta.nvim'

  -- Testing and autocomplete
  -- ================================
  use 'janko-m/vim-test'
  use 'editorconfig/editorconfig-vim'
  -- LSP
  use {
    'neovim/nvim-lspconfig',
  }

  -- LSP Install
  use {
    "kabouzeid/nvim-lspinstall",
    event = "VimEnter",
    config = [[require"luong.config.lspinstall"]],
  }

  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    config = [[require"luong.config.nvim-dap"]],
  }

  -- Debugger management
  use {
    "Pocco81/DAPInstall.nvim",
  }

  -- Formatter.nvim
  use {
    "mhartington/formatter.nvim",
    config = [[require"luong.config.formatter"]]
  }

  -- Linter
  use {
    "mfussenegger/nvim-lint",
    config = [[require"luong.config.nvim-lint"]]
  }

  -- Completion and snippet
  use {
    'hrsh7th/nvim-compe',
    requires = {'hrsh7th/vim-vsnip-integ'},
    config = [[require"luong.config.nvim-compe"]],
  }
  use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
  use { "rafamadriz/friendly-snippets", event = "InsertEnter" }

  -- Miscs
  -- ======================
  use 'vim-scripts/git-time-lapse'
  use { "npxbr/glow.nvim", run = "GlowInstall" }
  use 'rhysd/git-messenger.vim'

  use {
    'sindrets/diffview.nvim',
    config=[[require"luong.config.diffview"]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use { 'kdheepak/lazygit.nvim', config=[[require"luong.config.lazygit"]] }

  -- Syntax and language packs
  -- =========================
  -- https://github.com/sheerun/vim-polyglot/issues/309
  -- have to load vim go before vim polygot
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require"luong.config.nvim-treesitter"]],
  }

  -- markdown
  use 'gabrielelana/vim-markdown'
  vim.g.markdown_enable_mappings = false

  -- yard
  use 'noprompt/vim-yardoc'
  execute('hi link yardGenericTag rubyInstanceVariable')

  -- yaml
  use 'pedrohdz/vim-yaml-folds'

  -- rego
  use 'tsandall/vim-rego'

  -- terraform
  use 'hashivim/vim-terraform'
  use 'sbdchd/neoformat' -- Currently ALE does not support fix rego so we have to use neoformat

  -- jsonnet
  use 'google/vim-jsonnet'

  -- latex
  use {
    "lervag/vimtex",
    ft = "tex",
  }

  -- Rust tools
  -- TODO: use lazy loading maybe?
  use {"simrat39/rust-tools.nvim"}

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
  use 'tpope/vim-cucumber'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'junegunn/gv.vim'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-rake'
  use 'tpope/vim-bundler'
end)
