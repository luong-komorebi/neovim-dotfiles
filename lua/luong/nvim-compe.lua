local compe_ok, compe = pcall(require, "compe")
if not compe_ok then
  return
end
-- FileTypes in this list won't trigger auto-complete when TAB is pressed.  Hitting TAB will insert a tab character
local M = {}
local exclude_filetypes = { "md", "markdown", "mdown", "mkd", "mkdn", "mdwn", "text", "txt" }

compe.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    path = { kind = "   Path" },
    buffer = { kind = "   Buffer" },
    calc = { kind = "   Calc" },
    vsnip = { kind = "   Snippet" },
    nvim_lsp = { kind = "   LSP" },
    nvim_lua = false,
    spell = { kind = "   Spell" },
    tags = false,
    vim_dadbod_completion = false,
    snippets_nvim = false,
    ultisnips = false,
    treesitter = false,
    emoji = { kind = " ﲃ  Emoji", filetypes = { "markdown", "text" } },
  },
}

-- vsnip snippet dir
vim.g.vsnip_snippet_dir = O.vsnip_dir

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn["vsnip#available"](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<CR>", [[luaeval("require 'nvim-autopairs'.autopairs_cr()")]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", { noremap = true, silent = true, expr = true })

local is_excluded = function(file_type)
  for _, type in ipairs(exclude_filetypes) do
    if type == file_type then
      return true
    end
  end
  return false
end

M.set_tab_keybindings = function()
  local file_type = vim.fn.expand "%:e"
  if is_excluded(file_type) == false then
    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
  end
end

return M