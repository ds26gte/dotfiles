"last modified 2014-11-18

au bufread,bufnewfile * call s:recognize_footnotes()

func! s:recognize_footnotes()
  syn match title "†\S\+\%([:punct:]\)\@<!"

  syn region title start="^†" end="‡$"
endfunc
