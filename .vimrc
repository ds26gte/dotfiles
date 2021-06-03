" last modified 2020-11-29
" Dorai Sitaram

" for the tiny Vim that's installed by default on Ubuntu

if has('eval')
  finis
endif

set ai
set bg=dark
set com-=fb:-
set cot+=longest
set def+=\\\|^\\s*\\(const\\\|fun\\(ction\\\|c\\)\\?!\\?\\\|\\(\\(export\\)\\s\\+\\)\\?function\\\|let\\\|local\\(\\s\\+function\\)\\?\\\|var\\)
set dict=/usr/share/dict/words
set et
set flp=^\\s*\\d\\+[.]\\s\\+\\\|^\\s*[UNCOGTIMEWARP]\\+:\\s\\+\\\|^\\s*\\.\\+\\s\\+\\\|^\\s*-\\s\\+\\\|^\\s*[ivxIVX]\\+[.]\\s\\+
set fo-=t
set hid
set ic
set lbr
set lcs=tab:▶▷,trail:■,nbsp:+
set mouse=n
set nohls
set nojs
set noswf
set nu
set pa=.,,
set para+=DCEEEXFEFSIXRT\ \ .\ ig
set pp+=~/.config/nvim
set rtp+=~/.config/nvim
set scs
set sect+=SSsp
set sm
set spr
set sw=2
set swb+=usetab
set tw=65
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.mpx,*.o,*.odt,*.otf,*.ps,*.so,*.ttf,*.zo
set wim=longest:full,full

sil !date +"set pm=.\%Y-\%m-\%d-\%Hh\%M~" > ~/.patchmode.vim
so ~/.patchmode.vim

sil! ru plugin/aardvark.vim

hi linenr ctermfg=brown

ino jj <esc>
ino <tab> <c-n>

nno <c-k> <c-w>

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
