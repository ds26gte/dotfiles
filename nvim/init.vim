" last modified 2020-01-03
" Dorai Sitaram

set bri
set cb=unnamedplus
set cf
set cot+=longest
set def+=\\\|^\\s*\\((def\\k*\\\|const\\\|fun\\(ction\\\|c\\)\\?!\\?\\\|let\\\|local\\(\\s\\+function\\)\\?\\\|var\\)
set dict=/usr/share/dict/words
set dy-=msgsep
set et
set flp+=\\\|^\\s*[UNCOGTIMEWARP]\\+:\\s\\+\\\|^\\s*\\.\\+\\s
set hid
set ic
set inf
set lbr
set lw-=if
set nojs
set nosol
set noswf
set pa=.,,
set sbr=↪\ "
set spl=en_us
set spr
set sw=2
set swb+=usetab
set tgc
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.mpx,*.o,*.odt,*.otf,*.ps,*.so,*.ttf,*.zo
set wim=longest:full,full
sil! set icm=split
sil! set mouse=n
sil! set sd+=%

sil! syn off

cno <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

ino jj <esc>
ino <tab> <c-n>

nno <c-k> <c-w>
no - :

au bufread * sil! norm g`"

sil! let &pm = strftime('.%Y-%m-%d-%Hh%M~')

au vimleave * sil
      \ !BDIR=$HOME/.local/share/nvim/backup;
      \ BFF=.????-??-??-??h??~;
      \ BFF=".*$BFF *$BFF";
      \ mv -n $BFF $BDIR 2>/dev/null;
      \ test $PWD -ef $BDIR || rm -f $BFF

au bufwritepost * sil !updatestamp %

au bufread,bufnewfile *.a[^r]*,*.[1mt]*
      \ setl com-=mb:* cpt+=k fo+=n tw=65
