local M = {}
local utils = require "utils"

M.config = {
  on_config_done = nil,
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = false,
  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = "curved",
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  -- Add executables on the config.lua
  -- { exec, keymap, name}
  -- O.builtin.terminal.execs = {{}} to overwrite
  -- O.builtin.terminal.execs[#O.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
  execs = {
    { "lazygit", "lg", "LazyGit" },
  },
}

M.setup = function()
  local terminal = require "toggleterm"
  for _, exec in pairs(M.config.execs) do
    M.add_exec(exec[1], exec[2], exec[3])
  end
  terminal.setup(M.config)
end

M.add_exec = function(exec, keymap, name)
  vim.api.nvim_set_keymap(
    "n",
    "<leader>" .. keymap,
    "<cmd>lua require('luong.config.nvim-toggleterm')._exec_toggle('" .. exec .. "')<CR>",
    { noremap = true, silent = true }
  )
end

M._split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

M._exec_toggle = function(exec)
  local binary = M._split(exec)[1]
  local Terminal = require("toggleterm.terminal").Terminal
  if vim.fn.executable(binary) ~= 1 then
    local Log = require "luong.log"
    Log:error("Unable to run executable " .. binary .. ". Please make sure it is installed properly.")
    return
  end
  local exec_term = Terminal:new { cmd = exec, hidden = true }
  exec_term:toggle()
end


local function get_log_path(name)
  --handle custom paths not managed by Plenary.log
  local logger = require "luong.log"
  local file
  if name == "nvim" then
    file = CACHE_PATH .. "/log"
  else
    file = logger:new({ plugin = name }):get_path()
  end
  if utils.is_file(file) then
    return file
  end
end

---Toggles a log viewer according to log.viewer.layout_config
---param name can be the name of any of the managed logs, e,g. "nvim" or the default ones {"nvim", "lsp", "packer.nvim"}
M.toggle_log_view = function(name)
  local logfile = get_log_path(name)
  if not logfile then
    return
  end
  local term_opts = vim.tbl_deep_extend("force", M.config, {
    cmd = O.log.viewer.cmd .. " " .. logfile,
    open_mapping = O.log.viewer.layout_config.open_mapping,
    direction = O.log.viewer.layout_config.direction,
    -- TODO: this might not be working as expected
    size = O.log.viewer.layout_config.size,
    float_opts = O.log.viewer.layout_config.float_opts,
  })

  local Terminal = require("toggleterm.terminal").Terminal
  local log_view = Terminal:new(term_opts)
  -- require("luong.log"):debug("term", vim.inspect(term_opts))
  log_view:toggle()
end

return M
