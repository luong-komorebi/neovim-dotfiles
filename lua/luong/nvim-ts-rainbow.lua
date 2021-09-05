local ts_ok, ts = pcall(require, "nvim-treesitter.configs")
if not ts_ok then
  return
end

ts.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      O.pallete.red,
      O.pallete.green,
      O.pallete.yellow,
      O.pallete.blue,
      O.pallete.magenta,
      O.pallete.cyan,
      O.pallete.fg,
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
