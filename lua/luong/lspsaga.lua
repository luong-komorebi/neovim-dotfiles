local lsp_saga_status_ok, saga = pcall(require, "lspsaga")

if lsp_saga_status_ok then
  saga.init_lsp_saga {
    error_sign = "",
    warn_sign = "",
    infor_sign = "",
    hint_sign = "",
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    finder_action_keys = {
      open = "o",
      vsplit = "v",
      split = "s",
      quit = "q",
      scroll_down = "<C-f>",
      scroll_up = "<C-b>", -- quit can be a table
    },
  }
end
