"last modified 2014-08-21

au bufread,bufnewfile *.java call s:java_options()

func! s:java_options()
    setl mp=javac\ %
    setl tw=0
    setl cin
    setl cino=j1

    syn region comment oneline start="//" end="$"
    syn region comment start="/\*" end="\*/"
endfunc

au bufwritepost *.java make
