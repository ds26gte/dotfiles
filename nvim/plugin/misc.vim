" last modified 2019-10-15

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au bufread,bufnewfile view.unicode.tmp.1 syn match title /\<.\>/

au bufread,bufnewfile *.ref setl cpt+=k inf

au colorscheme bubblegum-256-dark hi matchparen gui=reverse

au filetype lua,vim setl fo-=ro

au filetype vim setl isk+=:

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

au filetype conf setl ft=sh

com! -nargs=1 NewDigraph exec "DigraphNew" <q-args> |
      \exec "sil !echo sil DigraphNew" <q-args> ">> ~/.config/nvim/after/plugin/moredig.vim" |
      \sil !trim-digraph-file

com! Sum !plus %

com! Vimp e ~/.config/nvim/plugin/misc.vim

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

nno <leader>o :Ofortune<cr>
