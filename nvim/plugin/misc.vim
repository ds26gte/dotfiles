" last modified 2019-02-19

ino <tab> <c-n>

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

au termopen * startinsert

"au termopen * setl scbk=-1 | startinsert

au termopen * sp +setl\ mod /tmp/viSessionHasOpenTerminalBuffers | close

au bufread * sil! norm g`"

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au filetype vim setl fo-=ro isk+=:

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

au vimleave * sil !mv -n {.,}*.????-??-??T??:??~ ~/.local/share/nvim/backup 2> /dev/null

au vimleave * sil !rm -f {.,}*.????-??-??T??:??~

let signify_vcs_list = ['git']

func! s:colorscheme_mods()
  " pmenusel shouldn't obscure underlayer when 'pb' set

  exec 'hi pmenusel guibg=' synIDattr(hlID('pmenu'), 'bg')

  let l:preferred_fg = synIDattr(hlID('title'), 'fg')
  if empty(l:preferred_fg)
    let l:preferred_fg = synIDattr(hlID('identifier'), 'fg')
  endif
  exec 'hi pmenusel guifg=' l:preferred_fg

  if synIDattr(hlID('pmenusel'), 'reverse')
    hi pmenusel gui=none
  endif
endfunc

au colorscheme * call s:colorscheme_mods()

au colorscheme apprentice hi! link whitespace errormsg

au colorscheme janah hi normal guifg=gray73

colo apprentice

com! Sum !plus %

com! Vimp e ~/.config/nvim/plugin/misc.vim

com! Htmlbeautify %!html-beautify -f -
