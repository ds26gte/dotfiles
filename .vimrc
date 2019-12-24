" last modified 2019-12-29
" Dorai Sitaram

" .vimrc for the tiny Vim that's installed by default in Ubuntu

set ar
set bo=all
set lcs+=tab:>-
set ls=2

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

so ~/.config/nvim/init.vim
so ~/.config/nvim/after/plugin/hilite.vim

" some text object fakery

"nno viw hebve
nno viw wbve
nno vaw hebvw

nno viW hEBvE
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
nmap dap vapd
nmap cip vipc
nmap cap vapc
nmap cis visc
nmap cas vasc
