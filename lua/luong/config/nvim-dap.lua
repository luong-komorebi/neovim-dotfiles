local M = {}
M.setup = function()
  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end
  local dap = require "dap"

  vim.fn.sign_define("DapBreakpoint", O.dap.breakpoint)
  dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

  local keys = {
    ["d"] = {
      name = "Debug",
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    },
  }

  wk.register(keys, { mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true })
end

return M
