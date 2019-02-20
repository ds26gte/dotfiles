" last modified 2019-02-25

func! Color_mods()

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
