" last modified 2014-11-28

au bufread,bufnewfile *.java call s:javaOptions()

func! s:javaOptions()
  setl mp=javac\ %
  setl cin
  setl cino=j1

  syn region comment oneline start='//' end='$'
  syn region comment start='/\*' end='\*/'
endfunc

au bufwritepost *.java make

set wig+=*.class
