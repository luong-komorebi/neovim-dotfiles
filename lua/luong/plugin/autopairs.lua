local npairs = require("nvim-autopairs")
local Rule = require "nvim-autopairs.rule"

require('nvim-treesitter.configs').setup {
  autopairs = {enable = true}
}

local ts_conds = require "nvim-autopairs.ts-conds"

npairs.setup({
  disable_filetype = { "CHADTree" },
  check_ts = true,
  ts_config = {
      lua = {'string'},-- it will not add pair on that treesitter node
      javascript = {'template_string'},
      java = false,-- don't check treesitter on java
      ruby = false,
  }
})

npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))

npairs.add_rules {
  -- press % => %% is only inside comment or string
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}

if package.loaded["compe"] then
  require("nvim-autopairs.completion.compe").setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
  }
end
