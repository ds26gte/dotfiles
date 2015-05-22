"last modified 2014-09-25

let g:rainbow_active = 1

let g:rainbow_conf = {
      \ 'ctermfgs' : [ 31, 179, 109, 133, 107, 125 ]
      \ }

au bufread,bufnewfile * RainbowToggle
