" last modified 2020-05-13
" Dorai Sitaram

set ai
set ar
set bdir=.,~/.local/share/nvim/backup
set bg=dark
set bo=all
set bs=indent,eol,start
set cpt-=i
set dir=~/.local/share/nvim/swap//
set dy+=lastline
set hi=10000
set hls
set is
set lcs+=tab:>-
set ls=2
set nf-=octal
set nofs
set ru
set sc
set sm
set ss=1
set sta
set tpm=50
set udir=~/.local/share/nvim/undo
set vi+=!,%

if has('eval')
  finis
endif

" this rest is for the tiny Vim that's installed by default in Ubuntu

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

so ~/.config/nvim/plugin/aardvark.vim
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
