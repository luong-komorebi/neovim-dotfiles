function! LightlineGitSigns()
  let l:sy = get(b:,'gitsigns_status','')
  return printf('%s', l:sy)
endfunction
