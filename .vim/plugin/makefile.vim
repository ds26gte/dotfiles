" last modified 2014-11-26

au bufread,bufnewfile *[Mm]akefile call s:makefile_options()

func! s:makefile_options()
  setl lcs=tab:•·
  setl list
  setl noet
  setl ts=4

  syn match errormsg "^ \+"
endfunc
