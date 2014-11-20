"last modified 2014-11-20

au bufread,bufnewfile * call s:recognize_footnotes()

func! s:recognize_footnotes()
  if !&tw && &sbr != ''
    return
  endif

  syn match title "†\S\+\%([:punct:]\)\@<!"

  syn region title start="^†" end="‡$"
endfunc
