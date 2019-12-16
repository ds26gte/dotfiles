" last modified 2019-12-20
" created < 2016-10
" Dorai Sitaram

let s:viewCounter = 0

func! ViewCmdOutput(cmd, args)
  let s:viewCounter += 1
  let l:tmpFile = split(&bdir, ',')[-1] . '/view.' .
        \ a:cmd . '.tmp.' . s:viewCounter
  exec 'sp' l:tmpFile
  sil exec '%!' . a:cmd . ' ' . a:args
  setl ft=help nobl nomod ro
  let b:viewCmd = a:cmd
  nno <buffer> K :call ViewCmdOutput(b:viewCmd, expand('<cword>'))<cr>
endfunc

" always open a help file in its own tab
au filetype help winc T

" sidestep default :Man as we have our own
let g:loaded_man = 1

com! -nargs=1 -complete=shellcmd Man call ViewCmdOutput('man', <q-args>)

com! -nargs=1 -complete=shellcmd Info call ViewCmdOutput('info', <q-args>)

com! -nargs=1 Dict call ViewCmdOutput('dict', '"' . <q-args> . '"')

nno d= :Dict<space>
