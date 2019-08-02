" last modified 2019-07-30

func! Color_mods()

  hi! link pmenusel number
  hi! link specialkey number
  hi! link whitespace number

endfunc

au colorscheme apprentice call Color_mods()

colo apprentice
