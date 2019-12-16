" last modified 2019-11-21
" created 2019-11-07
" Dorai Sitaram

com! -nargs=* Hexdigraph sil call s:hexdigraphFunc(<f-args>)

let s:digFile = '~/.config/nvim/after/plugin/moredig.vim'

func! s:hexdigraphFunc(lhs, rhs)
  exec 'dig' a:lhs printf('%d', '0x' . a:rhs)
  exec '!echo dig "' . a:lhs . '"' '$(printf \%d 0x' . a:rhs . ') >>' s:digFile
  exec '!sort -u' s:digFile '-o' s:digFile
endfunc
