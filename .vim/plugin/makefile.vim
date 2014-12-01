" last modified 2014-11-30

au bufread,bufnewfile *[Mm]akefile call s:makefileOptions()

func! s:makefileOptions()
  setl noet
  setl sw=0

  syn match errormsg '^ \+'
endfunc
