" last modified 2019-03-01

func! UniCycleOn()
  " don't mess with hyphen and dot
  inoremap <buffer> ' x<Esc>:call UniCycleApostrophe()<CR>a
  inoremap <buffer> " x<Esc>:call UniCycleQuote()<CR>a
endfunc

func! UniCycleOff()
  iunmap '
  iunmap "
endfunc

au filetype asciidoc setl cpt+=k inf tw=65

au filetype asciidoc UniCycleOn

au bufread,bufnewfile *.adoc? setf asciidoc

au bufread,bufnewfile status-*.adoc setl spell

au bufwritepost **/tmspeech/*.adoc sil !kadoc %

au bufwritepost status-*.adoc sil !yank4gmail %

au bufread,bufnewfile **/curr-reorg/**.adoc UniCycleOff

com! Tmspeech e ~/src/tmspeech/utopia.adoc

com! Gios e ~/src/ds26gte.github.io/patch/status-2018-09-28.adoc
