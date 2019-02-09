" last modified 2019-02-16

func! UniCycleTyping()
  "inoremap <buffer> - -<Esc>:call UniCycleHyphen()<CR>a
  "inoremap <buffer> . .<Esc>:call UniCyclePeriod()<CR>a
  inoremap <buffer> ' x<Esc>:call UniCycleApostrophe()<CR>a
  inoremap <buffer> " x<Esc>:call UniCycleQuote()<CR>a
endfunc

au filetype asciidoc setl cpt+=k inf tw=65 | call UniCycleTyping()

au bufread,bufnewfile *.adoc? setf asciidoc

au bufread,bufnewfile status-*.adoc setl spell

au bufwritepost **/tmspeech/*.adoc sil !kadoc %

au bufwritepost status-*.adoc sil !yank4gmail %

com! Tmspeech e ~/src/tmspeech/utopia.adoc

com! Gios e ~/src/ds26gte.github.io/patch/status-2018-09-28.adoc
