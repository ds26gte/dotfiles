" last modified 2020-01-24
" Dorai Sitaram

set et
set flp=^\\s*\\d\\+[.]\\s\\+\\\|^\\s*[UNCOGTIMEWARP]\\+:\\s\\+\\\|^\\s*\\.\\+\\s\\+
set hid
set ic
set inf
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

cno <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

ino jj <esc>
ino <tab> <c-n>

" c-w is disastrous on a chromebook
nno <c-k> <c-w>

no - :

au vimleave * sil
      \ !BDIR=$HOME/.local/share/nvim/backup;
      \ BFF=.????-??-??-??h??~;
      \ BFF=".*$BFF *$BFF";
      \ mv -n $BFF $BDIR 2>/dev/null;
      \ test $PWD -ef $BDIR || rm -f $BFF

au bufwritepost * sil !updatestamp %

au bufread,bufnewfile *.a[^r]*,*.[1mt]*
      \ setl com-=mb:* cpt+=k fo+=n tw=65
