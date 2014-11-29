" last modified 2014-11-28

au bufread,bufnewfile *[Mm]akefile call s:makefileOptions()

func! s:makefileOptions()
  setl lcs=tab:•·
  setl list
  setl noet
  setl ts=4

  syn match errormsg '^ \+'
endfunc
