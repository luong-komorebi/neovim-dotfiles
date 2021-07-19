local M = {}

M.config = function()
  O.lang.ruby = {
    diagnostics = {
      virtualtext = { spacing = 0, prefix = "" },
      signs = true,
      underline = true,
    },
    filetypes = { "rb", "erb", "rakefile", "ruby" },
    formatter = {
      exe = "bundle exec rubocop ",
      -- dirty trick from https://github.com/sbdchd/neoformat/pull/49/files
      args = { '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', 'sed "1,/^====================$/d"' },
      stdin = true,
    },
    linters = { "ruby" },
    settings = { -- solargraph lsp client settings
      solargraph = {
        diagnostics = true,
        autoformat = false, -- will enable true when it got out of experimental phase
        formatting = false, -- use nvim-formatter for now (async format)
      },
    },
  }
end

M.format = function()
  O.formatters.filetype["ruby"] = {
    function()
      return {
        exe = O.lang.ruby.formatter.exe,
        args = O.lang.ruby.formatter.args,
        stdin = O.lang.ruby.formatter.stdin,
      }
    end,
  }

  require("formatter.config").set_defaults {
    logging = false,
    filetype = O.formatters.filetype,
  }
end

M.lint = function()
  require("lint").linters_by_ft = {
    ruby = O.lang.ruby.linters,
  }
end

M.lsp = function()
  if require("lv-utils").check_lsp_client_active "solargraph" then
    return
  end

  -- If you are using rvm, make sure to change below configuration
  require("lspconfig").solargraph.setup {
    cmd = { DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph", "stdio" },
    on_attach = require("lsp").common_on_attach,
    handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = O.lang.ruby.diagnostics.virtual_text,
        signs = O.lang.ruby.diagnostics.signs,
        underline = O.lang.ruby.diagnostics.underline,
        update_in_insert = true,
      }),
    },
    filetypes = O.lang.ruby.filetypes,
    settings = O.lang.ruby.settings,
  }
end

M.dap = function()
  -- gem install readapt ruby-debug-ide
  if O.plugin.dap.active then
    local dap_install = require "dap-install"
    dap_install.config("ruby_vsc_dbg", {})
  end
end

return M
