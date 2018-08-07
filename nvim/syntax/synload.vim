" Last modified 2018-08-03

" If user explicitly asks for syntax highlighting, relent
" and let them have it.

if !exists('g:sourcingSynloadSecondTime')
  let g:sourcingSynloadSecondTime = 1
else
  so $VIMRUNTIME/syntax/synload.vim
endif 
