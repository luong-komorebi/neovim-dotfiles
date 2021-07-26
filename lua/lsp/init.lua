local execute = vim.api.nvim_command
local fn = vim.fn
local lsp_config = {}
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

fn.sign_define("LspDiagnosticsSignError",
    {text = "", texthl = "GruvboxRed"})
fn.sign_define("LspDiagnosticsSignWarning",
    {text = "", texthl = "GruvboxYellow"})
fn.sign_define("LspDiagnosticsSignInformation",
    {text = "", texthl = "GruvboxBlue"})
fn.sign_define("LspDiagnosticsSignHint",
    {text = "", texthl = "GruvboxAqua"})

local kind_symbols = {
  Text = '',
  Method = '',
  Function = 'ƒ',
  Constructor = '',
  Variable = '[]',
  Field = 'ﴲ',
  Class = '',
  Interface = 'ﰮ',
  Module = '',
  Property = '襁',
  Unit = '',
  Value = '',
  Enum = '練',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Folder = '',
  Reference = '',
  EnumMember = '',
  Constant = '',
  Struct = 'ﳤ',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

vim.lsp.protocol.CompletionItemKind = {
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
}

-- LSP settings
-- log file location: $HOME/.local/share/nvim/lsp.log
vim.lsp.set_log_level("debug")
local nvim_lsp = require('lspconfig')

-- scroll down hover doc or scroll in definition preview
-- scroll up hover doc
vim.cmd 'command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()'

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = O.lsp.diagnostics.virtual_text,
  signs = O.lsp.diagnostics.signs,
  underline = O.lsp.document_highlight,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = O.lsp.popup_border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = O.lsp.popup_border,
})

--[[ " autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100) ]]
-- Java
-- autocmd FileType java nnoremap ca <Cmd>lua require('jdtls').code_action()<CR>

local function documentHighlight(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
    [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gp', "<cmd>lua require'lsp'.PeekDefinition()<CR>", opts)
  buf_set_keymap('n', 'sd', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = "single" })<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = O.lsp.popup_border}})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = O.lsp.popup_border}})<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Taken from https://www.reddit.com/r/neovim/comments/gyb077/nvimlsp_peek_defination_javascript_ttserver/
function lsp_config.preview_location(location, context, before_context)
  -- location may be LocationLink or Location (more useful for the former)
  context = context or 15
  before_context = before_context or 0
  local uri = location.targetUri or location.uri
  if uri == nil then
    return
  end
  local bufnr = vim.uri_to_bufnr(uri)
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    vim.fn.bufload(bufnr)
  end

  local range = location.targetRange or location.range
  local contents = vim.api.nvim_buf_get_lines(
    bufnr,
    range.start.line - before_context,
    range["end"].line + 1 + context,
    false
  )
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  return vim.lsp.util.open_floating_preview(contents, filetype, { border = O.lsp.popup_border })
end

function lsp_config.preview_location_callback(_, method, result)
  local context = 15
  if result == nil or vim.tbl_isempty(result) then
    print("No location found: " .. method)
    return nil
  end
  if vim.tbl_islist(result) then
    lsp_config.floating_buf, lsp_config.floating_win = lsp_config.preview_location(result[1], context)
  else
    lsp_config.floating_buf, lsp_config.floating_win = lsp_config.preview_location(result, context)
  end
end

function lsp_config.PeekDefinition()
  if vim.tbl_contains(vim.api.nvim_list_wins(), lsp_config.floating_win) then
    vim.api.nvim_set_current_win(lsp_config.floating_win)
  else
    local params = vim.lsp.util.make_position_params()
    return vim.lsp.buf_request(0, "textDocument/definition", params, lsp_config.preview_location_callback)
  end
end

function lsp_config.PeekTypeDefinition()
  if vim.tbl_contains(vim.api.nvim_list_wins(), lsp_config.floating_win) then
    vim.api.nvim_set_current_win(lsp_config.floating_win)
  else
    local params = vim.lsp.util.make_position_params()
    return vim.lsp.buf_request(0, "textDocument/typeDefinition", params, lsp_config.preview_location_callback)
  end
end

function lsp_config.PeekImplementation()
  if vim.tbl_contains(vim.api.nvim_list_wins(), lsp_config.floating_win) then
    vim.api.nvim_set_current_win(lsp_config.floating_win)
  else
    local params = vim.lsp.util.make_position_params()
    return vim.lsp.buf_request(0, "textDocument/implementation", params, lsp_config.preview_location_callback)
  end
end

function lsp_config.common_on_attach(client, bufnr)
  documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
  -- lsp_config.common_on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false

  local ts_utils = require "nvim-lsp-ts-utils"

  -- defaults
  ts_utils.setup {
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,
    import_all_timeout = 5000, -- ms

    -- eslint
    eslint_enable_code_actions = true,
    eslint_enable_disable_comments = true,
    -- eslint_bin = O.lang.tsserver.linter,
    eslint_config_fallback = nil,
    eslint_enable_diagnostics = true,

    -- formatting
    enable_formatting = O.lang.tsserver.autoformat,
    formatter = O.lang.tsserver.formatter.exe,
    formatter_config_fallback = nil,

    -- parentheses completion
    complete_parens = false,
    signature_help_in_parens = false,

    -- update imports on file move
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = nil,
  }

  -- required to fix code action ranges
  ts_utils.setup_client(client)

  -- TODO: keymap these?
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})
end

require("lv-utils").define_augroups {
  _general_lsp = {
    { "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" },
  },
}

return lsp_config
