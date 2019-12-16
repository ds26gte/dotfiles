" last modified 2019-12-23
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
set icm=split
set inf
set lbr
set lw-=if
set mouse=n
set nojs
set nosol
set noswf
set pa=.,,
set sbr=↪\ "
set sd+=%
set spl=en_us
set spr
set sw=2
set swb+=usetab
set tgc
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.mpx,*.o,*.odt,*.otf,*.ps,*.so,*.ttf,*.zo
set wim=longest:full,full

ino jj <esc>

nno <c-k> <c-w>

au bufread * sil! norm g`"

ino <tab> <c-n>

cno <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

let &pm = strftime('.%Y-%m-%d-%Hh%M~')

au vimleave * sil
      \ !BDIR=$HOME/.local/share/nvim/backup;
      \ BFF=.????-??-??-??h??~;
      \ BFF=".*$BFF *$BFF";
      \ mv -n $BFF $BDIR 2>/dev/null;
      \ test $PWD -ef $BDIR || rm -f $BFF

au bufread,bufnewfile * syn match warningmsg 'FIXME\|TODO\|XXX' containedin=comment
