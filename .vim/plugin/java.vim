" last modified 2014-12-14

au bufread,bufnewfile *.java call s:javaOptions()

func! s:javaOptions()
  setl mp=javac\ %
  setl cin
  setl cino=j1
  setl tw=0

  syn region comment oneline start='//' end='$'
  syn region comment start='/\*' end='\*/'
endfunc

au bufwritepost *.java make

set wig+=*.class
