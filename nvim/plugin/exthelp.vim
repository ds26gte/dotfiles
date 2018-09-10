" last modified 2018-09-15
" Dorai Sitaram

let s:viewCounter = 0

func! ViewCmdOutput(cmd, args)
  let s:viewCounter += 1
  let l:tmpFile = split(&bdir, ',')[-1] . '/view.' .
        \ a:cmd . '.tmp.' . s:viewCounter
  exec 'tabe ' l:tmpFile
  sil exec '%!' . a:cmd . ' ' . a:args
  setl nobl nomod ro
  let b:viewCmd = a:cmd
  nmap <buffer> K :call ViewCmdOutput(b:viewCmd, expand("<cword>"))<cr>
endfunc

let g:loaded_man = 1

com! -nargs=1 -complete=shellcmd Man call ViewCmdOutput("man", <q-args>)

com! -nargs=1 -complete=shellcmd Info call ViewCmdOutput("info", <q-args>)

com! -nargs=1 Dict call ViewCmdOutput("dict", '"' . <q-args> . '"')

nmap <leader>w :Dict<space>
