" last modified 2020-09-15
" Dorai Sitaram

" for the tiny Vim that's installed by default on Ubuntu

if has('eval')
  finis
endif

set ai
set bg=dark

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

sil! so ~/.config/nvim/plugin/aardvark.vim

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

au bufread,bufnewfile *.lisp,*.rkt setl ep=scmindent.lua
