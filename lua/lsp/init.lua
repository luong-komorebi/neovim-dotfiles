local fn = vim.fn
local lsp_config = {}
-- local execute = vim.api.nvim_command
-- local nvim_lsp = require('lspconfig')

local status_ok, _ = pcall(require, "tokyonight")
if not status_ok then
  return
end

local c = O.pallete
-- Colors from tokyonight theme
local colors = {
  bg = c.bg,
  fg = c.fg,
  section_bg = c.bg_highlight,
  cyan = c.cyan,
  yellow = c.yellow,
  green = c.green,
  orange = c.orange,
  purple = c.purple,
  magenta = c.magenta,
  red = c.red,
  blue = c.blue,
}

fn.sign_define("LspDiagnosticsSignError", { text = "", texthl = colors.red })
fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = colors.yellow })
fn.sign_define("LspDiagnosticsSignInformation", { text = "", texthl = colors.blue })
fn.sign_define("LspDiagnosticsSignHint", { text = "", texthl = colors.cyan })

-- local kind_symbols = {
--   Text = '',
--   Method = '',
--   Function = 'ƒ',
--   Constructor = '',
--   Variable = '[]',
--   Field = 'ﴲ',
--   Class = '',
--   Interface = 'ﰮ',
--   Module = '',
--   Property = '襁',
--   Unit = '',
--   Value = '',
--   Enum = '練',
--   Keyword = '',
--   Snippet = '',
--   Color = '',
--   File = '',
--   Folder = '',
--   Reference = '',
--   EnumMember = '',
--   Constant = '',
--   Struct = 'ﳤ',
--   Event = '',
--   Operator = '',
--   TypeParameter = '',
-- }

vim.lsp.protocol.CompletionItemKind = {
  "   Text",
  "   Method",
  "   Function",
  "   Constructor",
  " ﴲ  Field",
  "[] Variable",
  "   Class",
  " ﰮ  Interface",
  "   Module",
  " 襁 Property",
  "   Unit",
  "   Value",
  " 練 Enum",
  "   Keyword",
  "   Snippet",
  "   Color",
  "   File",
  "   Reference",
  "   Folder",
  "   EnumMember",
  " ﲀ  Constant",
  " ﳤ  Struct",
  "   Event",
  "   Operator",
  "   TypeParameter",
}

-- LSP settings
-- log file location: $HOME/.local/share/nvim/lsp.log
vim.lsp.set_log_level "debug"

-- scroll down hover doc or scroll in definition preview
-- scroll up hover doc
vim.cmd 'command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()'

local function lsp_highlight_document(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gp", "<cmd>lua require'lsp'.PeekDefinition()<CR>", opts)
  buf_set_keymap("n", "sd", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = "single" })<CR>', opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = O.lsp.popup_border}})<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = O.lsp.popup_border}})<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
  local lsp_saga_status_ok, _ = pcall(require, "lspsaga")
  if lsp_saga_status_ok then
    -- this part is just for trying out lspsaga
    buf_set_keymap("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
    buf_set_keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
    buf_set_keymap("n", "sd", "<cmd>lua require('lspsaga.hover').render_hover_doc<CR>", opts)
    buf_set_keymap("n", "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    buf_set_keymap("n", "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    buf_set_keymap("n", "ca", "<cmd>lua require('lspsaga.codeaction').code_action()", opts)
    buf_set_keymap("v", "ca", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
    buf_set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
    buf_set_keymap("n", "gl", "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

  end
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
  local contents = vim.api.nvim_buf_get_lines(bufnr, range.start.line - before_context, range["end"].line + 1 + context, false)
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
  local lsp_signature_ok, lsp_signature = pcall(require, "lsp-signature")
  if lsp_signature_ok then
    lsp_signature.on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "single",
      },
    }, bufnr)
  end
  lsp_highlight_document(client, bufnr)
end

local function no_formatter_on_attach(client, bufnr)
  lsp_highlight_document(client)
  client.resolved_capabilities.document_formatting = false
end

function lsp_config.setup_handlers()
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
end

local function is_table(t)
  return type(t) == "table"
end

local function is_string(t)
  return type(t) == "string"
end

local function has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

function lsp_config.setup(lang)
  local lang_server = O.lang[lang].lsp
  local provider = lang_server.provider
  if require("lv-utils").check_lsp_client_active(provider) then
    return
  end

  local sources = require("lsp.null-ls").setup(lang)

  for _, source in pairs(sources) do
    local method = source.method
    local format_method = "NULL_LS_FORMATTING"

    if is_table(method) then
      if has_value(method, format_method) then
        lang_server.setup.on_attach = no_formatter_on_attach
      end
    end

    if is_string(method) then
      if method == format_method then
        lang_server.setup.on_attach = no_formatter_on_attach
      end
    end
  end

  require("lspconfig")[provider].setup(lang_server.setup)
end

return lsp_config
