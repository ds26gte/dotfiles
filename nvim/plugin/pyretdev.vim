" last modified 2019-02-13

au filetype pyret setl isk+=-

au bufread,bufnewfile **/public_html/*.js.* do bufread .js

au bufread,bufnewfile *.jarr do bufread .js

au bufread,bufnewfile *.arr setf pyret

au bufread,bufnewfile *.scrbl setl ft=

com! Pz      e ~/public_html/pyret-lang/tests/pyret/tests/test-parse-errors.arr
com! Py      e ~/public_html/pyret-lang/src/js/trove/parse-pyret.js
com! Spy     e ~/public_html/code.pyret.org/src/web/js/beforePyret.js
com! Trove   e ~/public_html/code.pyret.org/src/web/js/trove/image-lib.js
com! Wesed   e ~/public_html/wescheme2012/war-src/js/openEditor/editor.js
com! Wesj    e ~/public_html/wescheme2012/war-src/js/js-runtime/world/jsworld.js
