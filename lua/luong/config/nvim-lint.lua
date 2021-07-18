-- lint on save
require("lv-utils").define_augroups {
  autolint = {
    {
      "BufWritePost",
      "<buffer>",
      ":silent lua require('lint').try_lint()",
    },
    {
      "BufEnter",
      "<buffer>",
      ":silent lua require('lint').try_lint()",
    },
  },
}

require"lint"
