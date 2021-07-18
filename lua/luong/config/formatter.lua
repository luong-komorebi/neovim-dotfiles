-- format on save
require("lv-utils").define_augroups {
  autoformat = {
    {
      "BufWritePost",
      "*",
      ":silent FormatWrite",
    },
  },
}

require"formatter"
