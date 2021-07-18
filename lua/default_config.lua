CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

O = {
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
    inccommand = split, -- live substitution using vim's :substitue
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
    title = true, -- set the title of window to the value of the titlestring
    -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
    undodir = CACHE_PATH .. "/undo", -- set an undo directory
    undofile = true, -- enable persisten undo
    updatetime = 300, -- faster completion
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

  lsp = {
    diagnostics = {
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      signs = true,
      underline = true,
      document_highlight = true,
      popup_border = "single",
    },
  },

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

  formatters = {
    filetype = {},
  },

  user_autocommands = {
    { "Filetype", "qf", "set nobuflisted" },
  },

  -- TODO move all of this into lang specific files, only require when using
  lang = {
    efm = {},
    emmet = { active = false },
    svelte = {},
    tailwindcss = {
      active = false,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    },
    tsserver = {
      -- @usage can be 'eslint' or 'eslint_d'
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "prettier",
        args = {},
      },
    },
  },
}

function O.register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

require("lang.clang").config()
require("lang.cmake").config()
require("lang.css").config()
require("lang.dart").config()
require("lang.dockerfile").config()
require("lang.elixir").config()
require("lang.go").config()
require("lang.graphql").config()
require("lang.html").config()
require("lang.json").config()
require("lang.lua").config()
require("lang.python").config()
require("lang.ruby").config()
require("lang.rust").config()
require("lang.sh").config()
require("lang.terraform").config()
require("lang.vim").config()
require("lang.yaml").config()
