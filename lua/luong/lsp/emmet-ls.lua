-- if not package.loaded['lspconfig'] then
--   return
-- end

local nvim_lsp = require "lspconfig"
local configs = require "lspconfig/configs"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

configs.emmet_ls = {
  default_config = {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = { "html", "css", "javascript", "typescript", "vue" },
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {},
  },
}

nvim_lsp.emmet_ls.setup {
  -- on_attach = on_attach;
}
