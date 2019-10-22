" last modified 2019-10-22
" Dorai Sitaram

sil! so ~/.config/nvim/init.vim

set bo=all
set hl+=s:clear,S:clear,n:clear,*:clear,_:clear
set ls=2
set rtp^=/usr/share/nvim/runtime

sil !date +"set pm=.\%Y-\%m-\%d-\%H-\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

hi visual ctermfg=white ctermbg=darkblue
hi tablinesel ctermfg=251
