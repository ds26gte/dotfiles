" last modified 2019-11-07
" created 2019-11-07
" Dorai Sitaram

com! -nargs=* Hexdigraph sil call s:hexdigraphFunc(<f-args>)

func! s:hexdigraphFunc(lhs, rhs)
  exec 'dig' a:lhs printf('%d', '0x' . a:rhs)
endfunc

com! -nargs=* Setdigraph sil call s:setdigraphFunc(<f-args>)

let s:digFile = '~/.config/nvim/after/plugin/moredig.vim'
let s:tmpFile = '~/tmp/' . substitute(tempname(), '/', '', 'g')

func! s:setdigraphFunc(lhs, rhs)
  call s:hexdigraphFunc(a:lhs, a:rhs)
  exec '!echo Hexdigraph' a:lhs a:rhs '>>' s:digFile
  exec '!sort -u' s:digFile '>' s:tmpFile
  exec '!mv' s:tmpFile s:digFile
endfunc
