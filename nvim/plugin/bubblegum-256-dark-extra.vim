" last modified 2019-10-17

if !exists('g:colors_name') || g:colors_name != 'bubblegum-256-dark'
  finish
endif

" avoid bad feedback about where cursor is

hi matchparen gui=reverse
