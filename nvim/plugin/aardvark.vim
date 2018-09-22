" Last modified 2018-10-01
ino jj <esc>
nno <c-k> <c-w>
no! <c-h> <c-w>
set acd
set bri
set briopt+=shift:2
set cb=unnamedplus
set cf
set cot+=longest
set def+=\\\|^\\s*\\(const\\\|fun\\(ction\\\|c\\)\\?!\\?\\\|let\\\|local\\(\\s\\+function\\)\\?\\\|var\\)
set dict=/usr/share/dict/words
set et
set hid
set ic
set lbr
set nojs
set noswf
set pa=.,./**,./../**,./../../**,./../../../**,$HOME/**
set sbr=↪\ "
set scs
set sect+=~\ *\ "
set so=2
set spl=en_us
set sw=2
set swb+=usetab
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.o,*.odt,*.otf,*.pdf,*.ps,*.so,*.ttf,*.zo
set wim=list:longest,full
sil !mv -n {.,}*.????-??-??T??:??~ ~/.local/share/nvim/backup 2> /dev/null
sil !rm -f {.,}*.????-??-??T??:??~
sil! let &pm = strftime('.%Y-%m-%dT%H:%M~')
sil! set icm=split
sil! set mouse=a
sil! set sd^=<0,/0,%
