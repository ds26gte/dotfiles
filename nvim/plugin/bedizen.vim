" last modified 2019-06-20

func! Color_mods()

  hi pmenusel guifg=gold
  hi! link whitespace errormsg

endfunc

au colorscheme apprentice call Color_mods()

colo apprentice
