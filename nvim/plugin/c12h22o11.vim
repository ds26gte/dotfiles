" last modified 2018-08-19
" Dorai Sitaram

set bg=dark
set tgc

hi diffadd guibg=none guifg=mediumpurple1
hi diffchange guibg=none guifg=orchid
hi diffdelete gui=none guibg=none guifg=darkcyan
hi difftext guibg=none guifg=red
hi directory guifg=royalblue1
hi endofbuffer guifg=gray30
hi errormsg gui=bold guibg=darkred
hi foldcolumn guibg=none guifg=palegreen4
hi folded guibg=none guifg=palegreen4
hi linenr guifg=gray40
hi modemsg gui=none guifg=gray40
hi moremsg gui=none guifg=yellowgreen
hi nontext gui=none guifg=coral
hi normal guibg=gray15 guifg=gray78
hi pmenu guibg=gray23
hi question gui=none guifg=yellowgreen
hi search guibg=none guifg=mistyrose2
hi signcolumn guibg=none
hi specialkey guifg=steelblue2
hi statusline gui=none guibg=gray11 guifg=gray42
hi statuslinenc gui=none guibg=gray11 guifg=gray34
hi title gui=none guifg=navajowhite
hi vertsplit gui=none guifg=gray23
hi visual guibg=deepskyblue4

hi! link cursorlinenr linenr
hi! link incsearch visual
hi! link pmenusel visual
hi! link spellbad difftext
hi! link spellcap nontext
hi! link spelllocal visual
hi! link spellrare specialkey
hi! link tabline statuslinenc
hi! link tablinefill statusline
hi! link tablinesel statusline
hi! link warningmsg errormsg
