" last modified 2018-12-04
sil !date +"set pm=.\%Y-\%m-\%dT\%H:\%M~" > ~/.patchmode.vim
sil !test \! -d ~/.vim && ln -sf ~/.config/nvim ~/.vim
sil ru! plugin/aardvark.vim
sil ru! plugin/c12h22o11.vim
so ~/.patchmode.vim
