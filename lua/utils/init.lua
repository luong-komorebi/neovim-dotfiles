local utils = {}
local Log = require "luong.log"
local uv = vim.loop

--- Checks whether a given path exists and is a file.
--@param filename (string) path to check
--@returns (bool)
function utils.is_file(filename)
  local stat = uv.fs_stat(filename)
  return stat and stat.type == "file" or false
end

return utils

-- TODO: find a new home for these autocommands
