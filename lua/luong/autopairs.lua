local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

local Rule = require "nvim-autopairs.rule"
local cond = require "nvim-autopairs.conds"
local ts_conds = require "nvim-autopairs.ts-conds"

npairs.setup {
  disable_filetype = { "CHADTree" },
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add pair on that treesitter node
    javascript = { "template_string" },
    java = false, -- don't check treesitter on java
  },
}

require("nvim-treesitter.configs").setup {
  autopairs = { enable = true },
}

npairs.add_rule(Rule("$$", "$$", "tex"))
npairs.add_rules {
  Rule("$", "$", { "tex", "latex" }) -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex_check "%%") -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex_check("xxx", 3)) -- don't move right when repeat character
    :with_move(cond.none()) -- don't delete if the next character is xx
    :with_del(cond.not_after_regex_check "xx") -- disable  add newline when press <cr>
    :with_cr(cond.none()),
}
npairs.add_rules {
  Rule("$$", "$$", "tex"):with_pair(function(opts)
    print(vim.inspect(opts))
    if opts.line == "aa $$" then
      -- don't add pair on that line
      return false
    end
  end),
}
npairs.add_rules(require "nvim-autopairs.rules.endwise-ruby")
npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
npairs.add_rules {
  -- press % => %% is only inside comment or string
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}

-- skip it, if you use another global object
_G.MUtils = {}

if package.loaded["cmp"] then
  require("nvim-autopairs.completion.cmp").setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = true, -- automatically select the first item
  }
end
