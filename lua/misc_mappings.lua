local my_misc_mappings = {
  n = { -- normal mode
    -- turn off highlighting
    { "<CR>", "<ESC>:noh<CR>" },
    -- buffer navigation
    -- { "zh", "<C-W><C-H>" },
    -- { "zk", "<C-W><C-K>" },
    -- { "zl", "<C-W><C-L>" },
    -- { "zj", "<C-W><C-J>" },
    -- maaping buffer
    { ",b", ":buffer <C-z><S-Tab>" },
    { ",B", ":sbuffer <C-z><S-Tab>" },
    { "gb", ":ls<CR>:buffer<Space>" },
    { "gB", ":ls<CR>:sbuffer<Space>" },
    -- Jump to reference file under cursor in split window
    { "gf", ":vertical wincmd f<CR>" },
    -- Better window movement
    { "<C-h>", "<C-w>h", { silent = true } },
    { "<C-j>", "<C-w>j", { silent = true } },
    { "<C-k>", "<C-w>k", { silent = true } },
    { "<C-l>", "<C-w>l", { silent = true } },
    -- Resize with arrows
    { "<A-Up>", ":resize -2<CR>", { silent = true } },
    { "<A-Down>", ":resize +2<CR>", { silent = true } },
    { "<A-Left>", ":vertical resize -2<CR>", { silent = true } },
    { "<A-Right>", ":vertical resize +2<CR>", { silent = true } },
  },
  i = { -- insert mode
    -- Move current line / block with Alt-j/k ala vscode.
    { "<A-j>", "<Esc>:m .+1<CR>==gi" },
    { "<A-k>", "<Esc>:m .-2<CR>==gi" },

    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
  },
  x = { -- visual mode
    -- copy and paste multiple times
    { "p", "pgvy" },
  },
  t = { -- terminal mode
    -- bind control e to exit terminal mode
    { "<c-e>", "<C-\\><C-n>" },
    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
  },
  v = { -- Visual/Select mode
    -- Better indenting
    { "<", "<gv" },
    { ">", ">gv" },
  },
  [""] = {
    -- Toggle the QuickFix window
    { "<C-q>", ":call QuickFixToggle()<CR>" },
  },
}

O.register_mappings(my_misc_mappings, { silent = true, noremap = true })
