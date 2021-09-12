O.lsp = {
  completion = {
    item_kind = {
      "   (Text) ",
      "   (Method)",
      "   (Function)",
      "   (Constructor)",
      " ﴲ  (Field)",
      "[] (Variable)",
      "   (Class)",
      " ﰮ  (Interface)",
      "   (Module)",
      " 襁 (Property)",
      "   (Unit)",
      "   (Value)",
      " 練 (Enum)",
      "   (Keyword)",
      "   (Snippet)",
      "   (Color)",
      "   (File)",
      "   (Reference)",
      "   (Folder)",
      "   (EnumMember)",
      " ﲀ  (Constant)",
      " ﳤ  (Struct)",
      "   (Event)",
      "   (Operator)",
      "   (TypeParameter)",
    },
  },
  diagnostics = {
    signs = {
      active = true,
      values = {
        { name = "LspDiagnosticsSignError", text = "" },
        { name = "LspDiagnosticsSignWarning", text = "" },
        { name = "LspDiagnosticsSignHint", text = "" },
        { name = "LspDiagnosticsSignInformation", text = "" },
      },
    },
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    underline = true,
    severity_sort = true,
  },
  override = {},
  document_highlight = true,
  popup_border = "single",
  on_attach_callback = nil,
  on_init_callback = nil,
  null_ls = {
    setup = {},
  },
}