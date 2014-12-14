" last modified 2014-12-12

au bufread,bufnewfile /tmp/pico.* call s:alpine_options()

func! s:alpine_options()
  doau bufread pretend.txt
  setl mp=:
endfunc

func! Email_compatible()
  " all spaces are plain
  %s/ / /g
  " no need for more than 1 trailing space
  %s/ \{2,}$/ /
  " line with just space becomes blank
  %s/^\(\%(> \?\)*\) \+$/\1/
  " flushleft line not already ending in space should add it
  %s/^\%(\%(> \?\)* \)\?[^ >].* \@<!$/& /
  " nonflushleft line should lose trailing space
  %s/^\(\%(\%(> \?\)* \)\? .\{-}\) \+$/\1/
  " its previous line should lose trailing space too
  g/^\%(\%(> \?\)* \)\? / -1s/ \+$//
  " line with just emdash should lose trailing space
  %s/^\(\%(\%(> \?\)* \)\?—\) \+$/\1/
  " its previous line should lose trailing space too
  g/^\%(\%(> \?\)* \)\?—/ -1s/ \+$//
  " last line loses trailing space
  $ s/ \+$//
endfunc
