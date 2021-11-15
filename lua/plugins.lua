return {
  -- Theme and icons
  -- ======================
  { "wbthomason/packer.nvim" },
  { "folke/tokyonight.nvim" },
  { "kyazdani42/nvim-web-devicons" },

  -- jumping around
  -- ======================
  {
    "phaazon/hop.nvim",
    as = "hop",
    event = "BufWinEnter",
    config = [[require"luong.hop"]],
  },
  {
    "easymotion/vim-easymotion",
    event = "BufWinEnter",
    config = [[require'luong.easymotion']],
  },

  -- text searching, fuzzy search, file searching
  -- ======================
  { "haya14busa/incsearch.vim", event = "BufWinEnter" },
  { "haya14busa/incsearch-easymotion.vim", event = "BufWinEnter" },
  { "haya14busa/incsearch-fuzzy.vim", event = "BufWinEnter" },
  { "jesseleite/vim-agriculture", cmd = "RgRaw" },
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
  { "matze/vim-move", event = "BufWinEnter" },
  {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = [[require"luong.nvim-comment"]],
  },
  { "junegunn/vim-easy-align", event = "BufWinEnter", config = [[require"luong.easyalign"]] },
  {
    "windwp/nvim-autopairs",
    config = [[require"luong.autopairs"]],
    event = "BufWinEnter",
    after = "nvim-cmp",
  },
  { "mg979/vim-visual-multi", branch = "master", config = [[require"luong.vim-visual-multi"]] },
  { "dyng/ctrlsf.vim" },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
  { "ludovicchabant/vim-gutentags" },

  -- Additional text object
  -- ======================
  { "wellle/targets.vim", event = "BufWinEnter" },
  -- File and other Explorer  -- ======================
  {
    "ms-jpq/chadtree",
    branch = "chad",
    config = [[require"luong.chadtree"]],
    run = "python3 -m chadtree deps",
    cmd = "CHADopen",
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
    "NTBBloodbath/galaxyline.nvim",
    config = [[require"luong.galaxyline"]],
  },
  {
    "akinsho/bufferline.nvim",
    config = [[require"luong.bufferline"]],
    event = "BufWinEnter",
  },

  -- Passive support  -- ======================
  { "ntpeters/vim-better-whitespace", config = [[require"luong.better-whitespace"]] },
  {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-gps").setup {
        icons = {
          ["class-name"] = " ", -- Classes and class-like objects
          ["function-name"] = " ", -- Functions
          ["method-name"] = " ", -- Methods (functions inside class-like objects)
          ["container-name"] = " ", -- Containers (example: lua tables)
        },
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        mappings = { "<C-u>", "<C-d>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      }
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
  { "lukas-reineke/indent-blankline.nvim", event = "BufRead", config = [[require"luong.blankline"]] },
  { "preservim/vimux" },
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
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" },
  },
  { "ojroques/vim-oscyank" },

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
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        use_lsp_diagnostic_signs = true,
      }
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    config = [[require"luong.lspsaga"]],
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
    "hrsh7th/nvim-cmp",
    config = function()
      require("luong.nvim-cmp").config()
      require("luong.nvim-cmp").setup()
    end,
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
    },
    run = function()
      -- cmp's config requires cmp to be installed to run the first time
      if not O.builtin.cmp then
        require("luong.nvim-cmp").config()
      end
    end,
  },
  { "rafamadriz/friendly-snippets" },

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
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function()
      require("luong.nvim-toggleterm").setup()
    end,
  },

  -- Miscs  -- ======================
  { "ellisonleao/glow.nvim", ft = { "markdown" } },
  { "rhysd/git-messenger.vim" },
  {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require"luong.diffview"]],
  },

  -- Syntax and language packs
  -- =========================
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
    requires = { "nvim-treesitter/nvim-treesitter-textobjects", branch = "0.5-compat" },
    config = [[require"luong.nvim-treesitter"]],
  },
  -- markdown
  {
    "gabrielelana/vim-markdown",
    config = function()
      vim.g.markdown_enable_mappings = false
    end,
    ft = { "markdown" },
  },
  -- yard
  {
    "noprompt/vim-yardoc",
    config = function()
      local execute = vim.api.nvim_command
      execute "hi link yardGenericTag rubyInstanceVariable"
    end,
    ft = { "ruby" },
  },
  -- yaml
  { "towolf/vim-helm", ft = { "helm" } },
  { "pedrohdz/vim-yaml-folds" },
  -- rego
  { "tsandall/vim-rego", ft = { "rego" } },
  -- terraform
  { "hashivim/vim-terraform", ft = { "hcl", "terraform" } },
  { "sbdchd/neoformat", ft = { "rego" } }, -- Currently ALE does not support fix rego so we have to ,neoformat
  -- jsonnet
  { "google/vim-jsonnet" },
  -- latex
  {
    "lervag/vimtex",
    ft = { "tex" },
  },

  -- Tpope and his ruby magics  -- =========================
  { "tpope/vim-cucumber", ft = { "ruby" } },
  { "tpope/vim-projectionist", ft = { "ruby" } },
  { "tpope/vim-rake", ft = { "ruby" } },
  { "tpope/vim-bundler", ft = { "ruby" } },
}
