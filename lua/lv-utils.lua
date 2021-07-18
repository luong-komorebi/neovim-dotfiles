local lv_utils = {}

function lv_utils.check_lsp_client_active(name)
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name == name then
      return true
    end
  end
  return false
end

function lv_utils.define_augroups(definitions) -- {{{
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

function lv_utils.unrequire(m)
  package.loaded[m] = nil
  _G[m] = nil
end

lv_utils.define_augroups {

  _general_settings = {
    {
      "TextYankPost",
      "*",
      "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})",
    },
    {
      "BufWinEnter",
      "*",
      "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    },
    {
      "BufWinEnter",
      "dashboard",
      "setlocal cursorline signcolumn=yes cursorcolumn number",
    },
    {
      "BufRead",
      "*",
      "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    },
    {
      "BufNewFile",
      "*",
      "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    },
    { "BufWritePost", "lv-config.lua", "lua require('lv-utils').reload_lv_config()" },
  },
  _solidity = {
    { "BufWinEnter", ".tf", "setlocal filetype=hcl" },
    { "BufRead", "*.tf", "setlocal filetype=hcl" },
    { "BufNewFile", "*.tf", "setlocal filetype=hcl" },
  },
  _markdown = {
    { "FileType", "markdown", "setlocal wrap" },
    { "FileType", "markdown", "setlocal spell" },
  },
  _buffer_bindings = {
    { "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
  },
  _auto_resize = {
    -- will cause split windows to be resized evenly if main window is resized
    { "VimResized", "*", "wincmd =" },
  },
  _packer_compile = {
    -- will cause split windows to be resized evenly if main window is resized
    { "BufWritePost", "plugins.lua", "PackerCompile" },
  },

  _user_autocommands = O.user_autocommands,
}

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
endfunction
]]

return lv_utils
