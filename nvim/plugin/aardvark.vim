" aardvark.vim, last modified 2019-10-19
au bufread * sil! norm g`"
au colorscheme * hi normal guifg=none guibg=none
au colorscheme * run plugin/<amatch>.txt
au syntax diff ru syntax/diff.vim
au vimleave * sil !vimpackrat
cno <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'
exec 'colo' $VICOLOR
ino <tab> <c-n>
ino jj <esc>
let &pm = strftime('.%Y-%m-%d-%H-%M~')
let matchup_matchparen_offscreen = {}
let signify_vcs_list = ['git']
nno <c-k> <c-w>
nno <leader>d :SignifyDiff<cr>
nno <leader>f :SignifyHunkDiff<cr>
set bri
set cb=unnamedplus
set cf
set cot+=longest
set def+=\\\|^\\s*\\((def\\k*\\\|const\\\|fun\\(ction\\\|c\\)\\?!\\?\\\|let\\\|local\\(\\s\\+function\\)\\?\\\|var\\)
set dict=/usr/share/dict/words
set dy-=msgsep
set et
set hid
set ic
set lbr
set mouse=n
set nojs
set noswf
set pa=.,,
set sbr=...\ "
set scs
set spl=en_us
set sw=2
set swb+=usetab
set tgc
set wic
set wig=*.docx,*.dvi,*.eps,*.min.js,*.mpx,*.o,*.odt,*.otf,*.pdf,*.ps,*.so,*.ttf,*.zo
set wim=longest:full,full
sil! set icm=split
sil! set sd+=%
