" last modified 2015-02-11

au bufread $VIMRUNTIME/doc/*.txt call s:helpOptions()

func! s:helpOptions()
  nnoremap <buffer> <space> <c-f>
  nnoremap <buffer> b <c-b>
endfunc
