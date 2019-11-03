" last modified 2019-11-05
" Dorai Sitaram

" .vimrc for the tiny Vim that's installed by default in Ubuntu

sil! so ~/.config/nvim/init.vim

set ar
set bo=all
set lcs+=tab:>-
set ls=2

" some fake text objectery

nno dap }{d}
nno das )(d)

" not easy to define a pure i-version, but to accommodate muscle memory make
" it a synonym for the a-version

nno dip }{d}
nno dis )(d)

nno daW EBdW
nno daw ebdw
nno diW EBdE
nno diw ebde

nno cap }{c}
nno cas )(c)
nno cip }{c}
nno cis )(c)

nno caW WmkBc`k
nno caw wmkbc`k
nno ciW EBcW
nno ciw ebcw

nno gqap }{gq}
nno gqip }{gq}

au bufwritepost * sil !updatestamp %

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

nno \\0 :%!ftrim<cr>

so ~/.config/nvim/plugin/hilite.vim
hi endofbuffer ctermfg=240
hi statusline cterm=none ctermfg=248 ctermbg=237
hi statuslinenc cterm=none ctermfg=244 ctermbg=237
hi visual ctermbg=24
