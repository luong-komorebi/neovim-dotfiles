local dap = require"dap"

O.plugin.dap = {
  active = false,
  breakpoint = {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
}

vim.fn.sign_define("DapBreakpoint", O.plugin.dap.breakpoint)
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
