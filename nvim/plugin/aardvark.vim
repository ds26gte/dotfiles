" Last modified 2019-08-30
au bufread * sil! norm g`"
au vimleave * !export bkpfiles="*.????-??-??-??-??~ .*.????-??-??-??-??~"; mv -n $bkpfiles ~/.local/share/nvim/backup; rm -f $bkpfiles
ino <tab> <c-n>
ino jj <esc>
let &pm = strftime('.%Y-%m-%d-%H-%M~')
nno <c-k> <c-w>
set acd
set bri
set cb=unnamedplus
set cf
set cot+=longest
set def+=\\\|^\\s*\\(const\\\|fun\\(ction\\\|c\\)\\?!\\?\\\|let\\\|local\\(\\s\\+function\\)\\?\\\|var\\)
set dict=/usr/share/dict/words
set dy-=msgsep
set et
set hid
set ic
set lbr
set mouse=ar
set nojs
set noswf
set pa=.,./**,./../**,./../../**,./../../../**,$HOME/**
set sbr=↪\ "
set scs
set so=2
set spl=en_us
set sw=2
set swb+=usetab
set tgc
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.o,*.odt,*.otf,*.ps,*.so,*.ttf,*.zo
sil! au termopen * startinsert | sp +setl\ mod /tmp/viSessionHasOpenTerminalBuffers | close
sil! set icm=split
sil! set sd+=%
tno <c-v><esc> <esc>
tno <esc> <c-\><c-n>
