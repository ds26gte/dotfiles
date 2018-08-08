" last modified 2018-08-13
set ai
set bo=all
set lcs=tab:>\ ,trail:-,nbsp:+
set ls=2
sil !date +"set pm=.\%Y-\%m-\%dT\%H:\%M~" > ~/.patchmode.vim
sil !mv {.,}*.????-??-??T??:??~ ~/.vimbackup 2> /dev/null
sil ru plugin/aardvark.vim
sil ru! plugin/c12h22o11.vim
so ~/.patchmode.vim
