" last modified 2019-09-10

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au bufread,bufnewfile view.unicode.tmp.1 syn match title /\<.\>/

au filetype vim setl fo-=ro isk+=:

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

au filetype conf setl ft=sh

com! Htmlbeautify %!html-beautify -f -

com! -nargs=1 NewDigraph exec "DigraphNew" <q-args> | exec "sil !echo sil DigraphNew" <q-args> ">> ~/.config/nvim/after/plugin/moredig.vim" | !trim-digraph-file

com! Sum !plus %

com! Trimfile w | sil exec "!trimfile %" | e!

com! Vimp e ~/.config/nvim/plugin/misc.vim
