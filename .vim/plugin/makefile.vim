" last modified 2014-12-14

au bufread,bufnewfile *[Mm]akefile call s:makefileOptions()

func! s:makefileOptions()
  setl noet
  setl sw=0
  setl tw=0

  syn match errormsg '^ \+'
endfunc
