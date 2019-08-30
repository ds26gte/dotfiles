" last modified 2019-08-30

func! Color_mods()

  hi pmenusel ctermbg=238 ctermfg=200 guibg=gray27 guifg=hotpink
  hi search ctermfg=NONE ctermbg=17 guifg=NONE guibg=#000035
  hi specialkey ctermfg=179 guifg=darkgoldenrod
  hi whitespace ctermfg=20 guifg=mediumblue

endfunc

au colorscheme apprentice call Color_mods()

colo apprentice
