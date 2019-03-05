" last modified 2019-03-17

func! Color_mods()

  hi normal guibg=gray15 guifg=gray73
  hi pmenusel guibg=none guifg=gold
  hi statusline guibg=gray20 guifg=gray65
  hi statuslinenc guibg=gray20 guifg=gray50

  hi clear pmenu
  hi moremsg guifg=violet
  hi! link modemsg statuslinenc
  hi! link tabline statuslinenc
  hi! link tablinefill statuslinenc
  hi! link tablinesel statusline
  hi! link whitespace errormsg

endfunc

au colorscheme apprentice call Color_mods()

colo apprentice
