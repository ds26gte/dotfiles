" Last modified 2019-04-14
au bufread * sil! norm g`"
au termopen * startinsert | sp +setl\ mod /tmp/viSessionHasOpenTerminalBuffers | close
au vimleave * !export bkpfiles="*.????-??-??-??-??~ .*.????-??-??-??-??~"; mv -n $bkpfiles ~/.local/share/nvim/backup; rm -f $bkpfiles
ino <tab> <c-n>
let &pm = strftime('.%Y-%m-%d-%H-%M~')
let signify_vcs_list = ['git']
nno <c-k> <c-w>
no! <c-h> <c-w>
set acd
set bri
set bsk+=*.aes
set cb=unnamedplus
set cf
set cot+=longest
set def+=\\\|^\\s*\\(const\\\|fun\\(ction\\\|c\\)\\?!\\?\\\|let\\\|local\\(\\s\\+function\\)\\?\\\|var\\)
set dict=/usr/share/dict/words
set dy-=msgsep
set et
set hid
set ic
set icm=split
set lbr
set mouse=ar
set nohls
set nojs
set noswf
set pa=.,./**,./../**,./../../**,./../../../**,$HOME/**
set pb=41
set sbr=↪\ "
set scs
set sd+=%
set sect+=~\ *\ -\ --
set so=2
set spl=en_us
set sw=2
set swb+=usetab
set tgc
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.o,*.odt,*.otf,*.ps,*.so,*.ttf,*.zo
set wop=pum
tno <c-h> <c-w>
tno <c-v><esc> <esc>
tno <esc> <c-\><c-n>
