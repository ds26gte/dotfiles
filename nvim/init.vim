  "  last modified 2019-10-24
  " Dorai Sitaram
  syn off
au bufread * sil! norm g`"
au bufwritepost * sil !updatestamp %
au cmdlineenter * sil! let g:isk_sv = &l:isk | setl isk& noscs
au cmdlineleave * sil! let &l:isk = g:isk_sv | setl scs
au filetype gitcommit setl syn=diff
au syntax diff syn match diffadd '^+.*' | syn match difftext '^-.*'
au vimleave * sil !vipackrat
cno <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'
com! Blame Gblame | setl ma | ma x | sil %s/^.\{-}(// | noh | 'x | vert res 8
com! Ftrim w | sil exec '!trimfile %' | e!
ino <tab> <c-n>
ino jj <esc>
let &pm = strftime('.%Y-%m-%d-%H-%M~')
let matchup_matchparen_offscreen = {}
let signify_vcs_list = ['git']
nno <c-k> <c-w>
nno <leader>d :SignifyDiff<cr>
nno <leader>f :SignifyHunkDiff<cr>
nno \\t :tabc<cr>
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
set wig=*.docx,*.dvi,*.eps,*.min.js,*.mpx,*.o,*.odt,*.otf,*.ps,*.so,*.ttf,*.zo
set wim=longest:full,full
sil! exec 'so' system('dpkg-query -L fzf | grep fzf.vim | head -1')
sil! set icm=split
sil! set sd+=%
