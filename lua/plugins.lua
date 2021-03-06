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
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
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
          ["class-name"] = "??? ", -- classes and class-like objects
          ["function-name"] = "??? ", -- functions
          ["method-name"] = "??? ", -- methods (functions inside class-like objects)
          ["container-name"] = "??? ", -- containers (example: lua tables)
          ["tag-name"] = "???", -- tags (example: html tags)
        },
        depth = 0,
        depth_limit_indicator = "..",
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
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
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
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
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
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
  {
    "tpope/vim-bundler",
    cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" },
  },
  {
    "tpope/vim-rails",
    cmd = {
      "Eview",
      "Econtroller",
      "Emodel",
      "Smodel",
      "Sview",
      "Scontroller",
      "Vmodel",
      "Vview",
      "Vcontroller",
      "Tmodel",
      "Tview",
      "Tcontroller",
      "Rails",
      "Generate",
      "Runner",
      "Extract",
    },
  },
}
