" Last modified 2018-08-04

au bufread,bufnewfile **/public_html/**.{arr,bnf,jarr,js,js.*} call s:pyretOptions()

func! s:pyretOptions()
  setl pa^=$PYRETHOME/**,$PYRETHOME/../code.pyret.org/**
endfunc

au bufread,bufnewfile **/public_html/*.js.* do bufread .js

au bufread,bufnewfile *.jarr do bufread .js

au bufread,bufnewfile cpo-heroku do bufread binNot/pretend.sh

au bufread,bufnewfile *.arr setf pyret

au filetype pyret setl isk+=- isk-=:

au bufread,bufnewfile *.scrbl setl ft=

com! Gios e ~/src/ds26gte.github.io/patch/wescheme-ops.adoc
com! Pz e ~/public_html/pyret-lang/tests/pyret/tests/test-parse-errors.arr
com! Py e ~/public_html/pyret-lang/src/js/trove/parse-pyret.js
com! Spy e ~/public_html/code.pyret.org/src/web/js/beforePyret.js
com! Trove e ~/public_html/code.pyret.org/src/web/js/trove/image-lib.js
com! Wesed e ~/public_html/wescheme2012/war-src/js/openEditor/editor.js
com! Wesj e ~/public_html/wescheme2012/war-src/js/js-runtime/world/jsworld.js
