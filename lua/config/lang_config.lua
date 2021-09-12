O.lang = {
  dockerfile = {
    formatters = {
      -- { exe = "hadolint", args = { } }
    },
    linters = {
      { exe = "hadolint", args = {} },
    },
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
      -- {
      --   exe = "bundle exec rubocop ",
      --   -- dirty trick from https://github.com/sbdchd/neoformat/pull/49/files
      --   args = { "--auto-correct", "--stdin", "%:p", "2>/dev/null", "|", "awk 'f; /^====================$/{f=1}'" },
      -- },
    },
    linters = {
      -- {
      --   exe = "ruby",
      -- },
    }, -- this option will run a ruby process in background and consume cpu
    lsp = {
      provider = "solargraph",
      setup = {
        filetypes = { "rb", "erb", "rakefile", "ruby" },
        cmd = { DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph", "stdio" },
        settings = { -- solargraph lsp client settings
          solargraph = {
            diagnostics = true, -- this option may create false alert as solargraph uses global rubocop (not Gemfile specified)
            autoformat = false, -- disable because we use nvim for this functionality
            formatting = true,
          },
        },
        init_options = {
          formatting = true,
        },
      },
    },
  },
  go = {
    formatters = { {
      exe = "gofmt",
      args = {},
    } },
    linters = {},
    lsp = {
      provider = "gopls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/go/gopls",
        },
      },
    },
  },
}
