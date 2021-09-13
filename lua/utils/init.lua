local utils = {}
local Log = require "luong.log"
local uv = vim.loop
local home_dir = vim.loop.os_homedir()

--- Checks whether a given path exists and is a file.
--@param filename (string) path to check
--@returns (bool)
function utils.is_file(filename)
  local stat = uv.fs_stat(filename)
  return stat and stat.type == "file" or false
end

function utils.reload_config()
  require("luong.galaxyline").config()

  local config = require "config"
  config:load()

  require("misc_mappings").setup() -- this should be done before loading the plugins
  vim.cmd("source " .. home_dir .. "/.config/nvim/lua/plugins.lua")
  local plugins = require "plugins"
  local plugin_loader = require("plugin-loader").init()
  plugin_loader:load { plugins }
  vim.cmd ":PackerCompile"
  vim.cmd ":PackerInstall"
  -- vim.cmd ":PackerClean"
  local null_ls = require "new_lsp.null-ls"
  null_ls.setup(vim.bo.filetype, { force_reload = true })
  Log:info "Reloaded configuration"
end

function utils.unrequire(m)
  package.loaded[m] = nil
  _G[m] = nil
end

function utils.gsub_args(args)
  if args == nil or type(args) ~= "table" then
    return args
  end
  local buffer_filepath = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
  for i = 1, #args do
    args[i] = string.gsub(args[i], "${FILEPATH}", buffer_filepath)
  end
  return args
end

return utils

-- TODO: find a new home for these autocommands
