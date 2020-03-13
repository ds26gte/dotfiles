" last modified 2020-03-13
" Dorai Sitaram

" .vimrc for the tiny Vim that's installed by default in Ubuntu

set ai
set ar
set bg=dark
set bo=all
set lcs+=tab:>-
set ls=2
set sm

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

so ~/.config/nvim/plugin/aardvark.vim
so ~/.config/nvim/pack/3rdpartyplugins/start/hilite.vim/plugin/hilitelinks.vim
so ~/.config/nvim/pack/3rdpartyplugins/start/hilite.vim/plugin/hilite.vim

" some text-object fakery

nno viw wbve
nno vaw hebvw

nno viW WBvE
nno vaW hEBvW

nno vis )(v)b
nno vas )(v)h

nno vap }{e0v}
nno vip }{e0v}b$

nno dap }{d}
nno das )(d)

nno diW EBdE
nno daW EBdW

nno diw ebde
nno daw ebdw

nno ciw ebcw
nno caw wmkbc`k

nno ciW EBcW
nno caW WmkBc`k

nmap gqip vipgq
nmap gqap vapgq

nmap dip vipd
nmap cip vipc
nmap cap vapc
nmap cis visc
nmap cas vasc

au bufwritepost * sil !updatestamp %

au bufread,bufnewfile *.lisp,*.rkt setl ep=scmindent.lua
