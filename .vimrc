" last modified 2019-10-25
" Dorai Sitaram

sil! so ~/.config/nvim/init.vim

set ar
set bo=all
set ls=2
set rtp^=/usr/share/nvim/runtime

au bufwritepost * sil !updatestamp %

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

hi endofbuffer ctermfg=240
hi statusline cterm=none ctermfg=248 ctermbg=237
hi statuslinenc cterm=none ctermfg=244 ctermbg=237
hi tabline cterm=none ctermfg=245 ctermbg=237
hi tablinefill cterm=none ctermbg=237
hi tablinesel cterm=none ctermfg=248 ctermbg=237
hi visual ctermbg=24
