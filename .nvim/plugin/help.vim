" last modified 2015-02-19

au bufenter $VIMRUNTIME/doc/*.txt,**opted/wb*.txt call s:pagingOptions()

"au bufenter $VIMRUNTIME/doc/*.txt call s:helpOptions()
au bufenter $VIMRUNTIME/doc/*.txt call s:helpOptions()

func! s:helpOptions()
  exec "norm \<c-w>T"
endfunc

func! s:pagingOptions()
  nnoremap <buffer> <space> <c-f>
  nnoremap <buffer> b <c-b>
endfunc
