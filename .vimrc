" last modified 2019-10-24
"Dorai Sitaram
hi tablinesel ctermfg=251
hi visual ctermfg=white ctermbg=darkblue
set ar
set bo=all
set hl+=s:clear,S:clear,n:clear,*:clear,_:clear
set ls=2
set rtp^=/usr/share/nvim/runtime
sil !date +"set pm=.\%Y-\%m-\%d-\%H-\%M~" > ~/.patchmode.vim
sil! so ~/.config/nvim/init.vim
so ~/.patchmode.vim
