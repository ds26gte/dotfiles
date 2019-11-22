" last modified 2019-11-26
" Dorai Sitaram

" .vimrc for the tiny Vim that's installed by default in Ubuntu

sil! so ~/.config/nvim/init.vim

set ar
set bo=all
set lcs+=tab:>-
set ls=2

"au vimleave * bufdo !updatestamp %

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

nno \\0 :%!spctrim<cr>

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
