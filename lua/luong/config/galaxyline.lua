-- galaxy line depends on colors from tokyonight, so to prevent this from failure in first load:
local status_ok, _ = pcall(require, "tokyonight")
if not status_ok then
  return
end

local gl = require "galaxyline"
local condition = require "galaxyline.condition"
local gls = gl.section
local c = O.pallete

gl.short_line_list = { "qf", "vista_kind", "terminal", "packer", "CHADTree", "DiffviewFiles" }
-- Colors from tokyonight theme
local colors = {
  bg = c.bg,
  fg = c.fg,
  section_bg = c.bg_highlight,
  cyan = c.cyan,
  yellow = c.yellow,
  green = c.green,
  orange = c.orange,
  purple = c.purple,
  magenta = c.magenta,
  red = c.red,
  blue = c.blue,
}
local left_separator = ""

table.insert(gls.left, {
  FirstElement = {
    provider = function()
      return "▋"
    end,
    highlight = { colors.cyan, colors.cyan },
  },
})


table.insert(gls.left, {
   statusicon = {
      provider = function()
         return "  "
      end,
      highlight = { colors.section_bg, colors.cyan },
      separator = "  ",
      separator_highlight = { colors.nord_blue, colors.one_bg2 },
   },
})

table.insert(gls.left, {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local alias = {
        n = "NORM",
        i = "INS",
        c = "CMD",
        V = "VISUAL",
        [""] = "VISUAL",
        v = "VISUAL",
        ["r?"] = ":CONFIRM",
        rm = "--MORE",
        R = "REPLACE",
        Rv = "VIRTUAL",
        s = "SELECT",
        S = "SELECT",
        ["r"] = "HIT-ENTER",
        [""] = "SELECT",
        t = "TERMINAL",
        ["!"] = "SHELL",
      }
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.purple,
        [""] = colors.purple,
        V = colors.purple,
        c = colors.magenta,
        no = colors.blue,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.red,
        cv = colors.blue,
        ce = colors.blue,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.blue,
        t = colors.blue,
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return alias_mode .. " "
    end,
    highlight = { colors.bg, colors.bg },
    separator = "  ",
    separator_highlight = { colors.bg, colors.section_bg },
  },
})

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { colors.bg, colors.section_bg },
    highlight = { colors.orange, colors.section_bg },
  },
})

table.insert(gls.left, {
  GitBranch = {
    provider = function()
      local vcs = require "galaxyline.provider_vcs"
      local branch_name = vcs.get_git_branch()
      if vcs.get_git_branch() == nil then
        return "~ merge conflict" .. " "
      end
      if string.len(branch_name) > 28 then
        return string.sub(branch_name, 1, 25) .. "..."
      end
      return branch_name .. " "
    end,
    condition = condition.check_git_workspace,
    highlight = { colors.fg, colors.section_bg },
  },
})

table.insert(gls.left, {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.green, colors.section_bg },
  },
})

table.insert(gls.left, {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = { colors.blue, colors.section_bg },
  },
})

table.insert(gls.left, {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.red, colors.section_bg },
  },
})

table.insert(gls.left, {
  Filler = {
    provider = function()
      return " "
    end,
    highlight = { colors.grey, colors.section_bg },
  },
})

table.insert(gls.right, {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = { colors.red, colors.section_bg },
  },
})
table.insert(gls.right, {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = { colors.orange, colors.section_bg },
  },
})

table.insert(gls.right, {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = { colors.yellow, colors.section_bg },
  },
})

table.insert(gls.right, {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = { colors.blue, colors.section_bg },
  },
})

local get_lsp_client = function(msg)
  msg = msg or "LSP Inactive"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  local buf_client_names = {}

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      if client.name == "null-ls" then
        table.insert(buf_client_names, O.lang[buf_ft].linters[1])
        table.insert(buf_client_names, O.lang[buf_ft].formatter.exe)
      else
        table.insert(buf_client_names, client.name)
      end
    end
  end

  return table.concat(buf_client_names, ", ")
end

table.insert(gls.right, {
  ShowLspClient = {
    provider = get_lsp_client,
    condition = condition.hide_in_width or function()
      local tbl = { ["dashboard"] = true, [" "] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = "  ",
    highlight = { colors.grey, colors.section_bg },
  },
})

table.insert(gls.right, {
  left_arrow1 = {
      provider = function() end,
      separator = " " .. left_separator,
      separator_highlight = { colors.section_bg, colors.section_bg },
   },
})

table.insert(gls.right, {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.section_bg },
  },
})

table.insert(gls.right, {
  BufferType = {
    provider = "FileTypeName",
    condition = condition.hide_in_width or condition.buffer_not_empty,
    separator_highlight = { colors.bg, colors.section_bg },
    highlight = { colors.grey, colors.section_bg },
    separator = " ",
  },
})

table.insert(gls.right, {
  left_arrow2 = {
      provider = function() end,
      separator = " " .. left_separator,
      separator_highlight = { colors.section_bg, colors.section_bg },
   },
})

table.insert(gls.right, {
   some_roundicon = {
      provider = function()
         return " "
      end,
      separator = left_separator,
      separator_highlight = { colors.green, colors.grey },
      highlight = { colors.section_bg, colors.green },
   },
})

table.insert(gls.right, {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = { colors.green, colors.green },
    highlight = { colors.bg, colors.green },
  },
})

table.insert(gls.right, {
  PerCent = {
    provider = "LinePercent",
    separator = "",
    highlight = { colors.bg, colors.green },
  },
})

-- table.insert(gls.right, {
--   FileEncode = {
--     provider = "FileEncode",
--     condition = condition.hide_in_width,
--     separator = left_separator,
--     separator_highlight = { colors.bg, colors.section_bg },
--     highlight = { colors.grey, colors.section_bg },
--   },
-- })

table.insert(gls.short_line_left, {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
  },
})

table.insert(gls.short_line_right, {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = { colors.fg, colors.section_bg },
  },
})
