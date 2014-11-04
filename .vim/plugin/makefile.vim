"last modified 2014-11-02

au bufread,bufnewfile *[Mm]akefile call s:makefile_options()

func! s:makefile_options()
  setl lcs=tab:•·
  setl list
  setl noet
  setl ts=4
  setl tw=0

  syn match errormsg "^ \+"
endfunc
