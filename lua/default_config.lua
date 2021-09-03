CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

O = {
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "warn",
    viewer = {
      ---@usage this will fallback on "less +F" if not found
      cmd = "lnav",
      layout_config = {
        ---@usage direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = "horizontal",
        open_mapping = "",
        size = 40,
        float_opts = {},
      },
    },
  },

  lsp = {
    completion = {
      item_kind = {
        "   (Text) ",
        "   (Method)",
        "   (Function)",
        "   (Constructor)",
        " ﴲ  (Field)",
        "[] (Variable)",
        "   (Class)",
        " ﰮ  (Interface)",
        "   (Module)",
        " 襁 (Property)",
        "   (Unit)",
        "   (Value)",
        " 練 (Enum)",
        "   (Keyword)",
        "   (Snippet)",
        "   (Color)",
        "   (File)",
        "   (Reference)",
        "   (Folder)",
        "   (EnumMember)",
        " ﲀ  (Constant)",
        " ﳤ  (Struct)",
        "   (Event)",
        "   (Operator)",
        "   (TypeParameter)",
      },
    },
    diagnostics = {
      signs = {
        active = true,
        values = {
          { name = "LspDiagnosticsSignError", text = "" },
          { name = "LspDiagnosticsSignWarning", text = "" },
          { name = "LspDiagnosticsSignHint", text = "" },
          { name = "LspDiagnosticsSignInformation", text = "" },
        },
      },
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      underline = true,
      severity_sort = true,
    },
    override = {},
    document_highlight = true,
    popup_border = "single",
    on_attach_callback = nil,
    on_init_callback = nil,
    null_ls = {
      setup = {},
    },
  },

  leader_key = [[\]],
  has_sourced = false,
  pallete = {}, -- color pallete to do custom coloring
  vsnip_dir = vim.fn.stdpath "config" .. "/snippets",
  default_options = {
    autoread = true, --  When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
    backup = false, -- creates a backup file
    backspace = "indent,eol,start", -- allow backspacing over autoindent and line breaks(join lines) and start of insert
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    colorcolumn = "99999", -- fixes indentline for now
    cursorline = true, -- highlight the current line
    completeopt = { "menuone", "noselect" },
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    inccommand = "split", -- live substitution using vim's :substitue
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    -- showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    title = false, -- set the title of window to the value of the titlestring
    -- titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
    undodir = CACHE_PATH .. "/undo", -- set an undo directory
    undofile = true, -- enable persisten undo
    updatetime = 300, -- faster completion
    timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    softtabstop = 2, -- Number of spaces that a <Tab> counts for while performing editing operations
    number = true, -- set numbered lines
    relativenumber = false, -- set relative numbered lines
    ruler = true, -- Show the line and column number of the cursor position
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "number", -- recently vim can merge signcolumn and number column into one
    spell = false,
    spelllang = "en",
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
    wrap = true, -- display lines as one long line
    linebreak = true, -- wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen
    breakindent = true, -- every wrapped line will continue visually indented
    list = true,
    listchars = [[lead:·,tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨]], -- notice the backslash character in lua
    showbreak = [[↪\]],
    diffopt = [[filler,internal,algorithm:histogram,indent-heuristic]], -- Tip: histogram-based diffs using modern Vim integration with git's xdiff
    foldenable = false,
  },

  plugin = {},

  disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin", -- 'man',
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugi",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    -- 'matchit', 'matchparen', 'shada_plugin',
  },
}

O.lang = {
  docker = {
    formatters = {
      -- exe = "",
      -- args = {},
    },
    linters = {},
    lsp = {
      provider = "dockerls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver",
          "--stdio",
        },
      },
    },
  },
  lua = {
    formatters = {
      {
        exe = "stylua",
        args = {},
      },
    },
    linters = {
      {
        exe = "luacheck",
      },
    },
    lsp = {
      provider = "sumneko_lua",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
          "-E",
          DATA_PATH .. "/lspinstall/lua/main.lua",
        },
        -- on_attach = common_on_attach,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
              -- Setup your lua path
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim", "O" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 1000,
            },
          },
        },
      },
    },
  },
  python = {
    formatters = {
      {
        exe = "black",
        args = { "--line-length=99" },
      },
    },
    linters = {
      {
        exe = "flake8",
      },
    },
    lsp = {
      provider = "pyright",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
          "--stdio",
        },
      },
    },
  },
  ruby = {
    formatters = {
      {
        exe = "bundle exec rubocop ",
        -- dirty trick from https://github.com/sbdchd/neoformat/pull/49/files
        args = { "--auto-correct", "--stdin", "%:p", "2>/dev/null", "|", "awk 'f; /^====================$/{f=1}'" },
      },
    },
    linters = {
      {
        exe = "ruby",
      },
    }, -- this option will run a ruby process in background and consume cpu
    lsp = {
      provider = "solargraph",
      setup = {
        filetypes = { "rb", "erb", "rakefile", "ruby" },
        cmd = { DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph", "stdio" },
        settings = { -- solargraph lsp client settings
          solargraph = {
            diagnostics = true, -- this option may create false alert as solargraph uses global rubocop (not Gemfile specified)
            autoformat = false, -- disable because we use nvim formatters
            formatting = false,
          },
        },
        init_options = {
          formatting = true,
        },
      },
    },
  },
  -- go = {
  --   formatters = {
  --     exe = "gofmt",
  --     args = {},
  --     stdin = true,
  --   },
  --   linters = {
  --     "golangcilint",
  --     "revive",
  --   },
  --   lsp = {
  --     provider = "gopls",
  --     setup = {
  --       cmd = {
  --         DATA_PATH .. "/lspinstall/go/gopls",
  --       },
  --       on_attach = common_on_attach,
  --     },
  --   },
  -- },
}
