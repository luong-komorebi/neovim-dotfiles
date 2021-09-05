local chadtree_settings = {
  ["ignore.path_glob"] = { "^node_modules" },
  ["theme.text_colour_set"] = "env",
  ["keymap.v_split"] = { "w", "<c-v>" },
  ["keymap.h_split"] = { "W", "<c-x>" },
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
