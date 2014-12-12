" last modified 2014-12-12

au bufread,bufnewfile /tmp/pico.* call s:alpine_options()

func! s:alpine_options()
  doau bufread pretend.txt
  setl mp=:
endfunc

func! Alpine_spaces()
  " all spaces are plain
  %s/ / /g
  " no need for more than 1 trailing space
  %s/ \{2,}$/ /
  " line with just space becomes blank
  %s/^ $//
  " flushleft line not already ending in space should add it
  %s/^\%(> \)*[^ >].* \@<!$/& /
  " nonflushleft line ending in space should lose it
  %s/^\(\%(> \)* .*\) $/\1/
  " if its previous line ends in space, it should lose it
  g/^\%(> \)* / -1s/ $//
endfunc
