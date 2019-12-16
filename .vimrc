" last modified 2019-12-20
" Dorai Sitaram

" .vimrc for the tiny Vim that's installed by default in Ubuntu

set ar
set bo=all
set et
set flp+=\\\|^\\s*[UNCOGTIMEWARP]\\+:\\s\\+
set hid
set ic
set inf
set lbr
set lcs+=tab:>-
set ls=2
set lw-=if
set nojs
set nosol
set noswf
set pa=.,,
set spr
set sw=2
set swb+=usetab
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.mpx,*.o,*.odt,*.otf,*.ps,*.so,*.ttf,*.zo
set wim=longest:full,full

ino jj <esc>

nno <c-k> <c-w>

no - :

au vimleave * bufdo !updatestamp %

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

so ~/.config/nvim/plugin/hilink.vim
hi endofbuffer ctermfg=240
hi statusline cterm=none ctermfg=245
hi statuslinenc cterm=none ctermfg=241
hi visual ctermbg=24

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
