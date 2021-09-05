local nvim_comment_ok, nvim_comment = pcall(require, "nvim_comment")
if nvim_comment_ok then
  nvim_comment.setup {
    comment_empty = false, -- ignore empty lines
  }
end
