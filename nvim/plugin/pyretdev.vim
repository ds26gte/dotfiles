" last modified 2019-03-29

au filetype pyret setl isk+=-

au bufread,bufnewfile **/public_html/*.js.* do bufread .js

au bufread,bufnewfile *.jarr do bufread .js

au bufread,bufnewfile *.arr setf pyret

au bufread,bufnewfile *.scrbl setl ft=

au bufread,bufnewfile **/curr-reorg/**.adoc let b:turnUniCyclingOff = 1

com! Gios     e ~/src/ds26gte.github.io/patch/status-2018-09-28.adoc
com! Py       e ~/public_html/pyret-lang/src/js/trove/parse-pyret.js
com! Pz       e ~/public_html/pyret-lang/tests/pyret/tests/test-parse-errors.arr
com! Remixrkt e ~/src/curriculum/shared/langs/en-us/function-directives.rkt
com! Spy      e ~/public_html/code.pyret.org/src/web/js/beforePyret.js
com! Trove    e ~/public_html/code.pyret.org/src/web/js/trove/image-lib.js
com! Wesed    e ~/public_html/wescheme2012/war-src/js/openEditor/editor.js
com! Wesj     e ~/public_html/wescheme2012/war-src/js/js-runtime/world/jsworld.js
