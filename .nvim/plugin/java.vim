"last modified 2014-08-15

au bufread,bufnewfile *.java call s:java_options()

func! s:java_options()
    setl mp=javac\ %
    setl tw=0
    setl ep=astyle\ --mode=java\ --style=java

    syn region comment oneline start="//" end="$"
    syn region comment start="/\*" end="\*/"
endfunc

au bufwritepost *.java make
