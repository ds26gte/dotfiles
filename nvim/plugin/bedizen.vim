" last modified 2019-03-03

func! Color_mods()

  hi normal guibg=gray15 guifg=gray73
  hi normalnc guibg=gray18
  hi pmenusel guibg=none guifg=palegreen
  hi statusline guibg=gray20 guifg=gray65
  hi statuslinenc guibg=gray20 guifg=gray50

  hi clear pmenu
  hi moremsg guifg=violet
  hi! link cursorlinenr linenr
  hi! link modemsg statuslinenc
  hi! link tabline statuslinenc
  hi! link tablinefill statuslinenc
  hi! link tablinesel statusline
  hi! link whitespace errormsg

endfunc

au colorscheme apprentice call Color_mods()

colo apprentice
