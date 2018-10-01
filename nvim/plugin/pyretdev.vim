" last modified 2018-10-01

au filetype pyret setl isk+=-

au bufread,bufnewfile **/public_html/*.js.* do bufread .js

au bufread,bufnewfile *.jarr do bufread .js

au bufread,bufnewfile *.arr setf pyret

au bufread,bufnewfile *.scrbl setl ft=

au bufread,bufnewfile status-*.adoc setl spell

au bufwritepost status-*.adoc sil !yank4gmail %

com! Gios    e ~/src/ds26gte.github.io/patch/status-2018-09-28.adoc
com! Pz      e ~/public_html/pyret-lang/tests/pyret/tests/test-parse-errors.arr
com! Py      e ~/public_html/pyret-lang/src/js/trove/parse-pyret.js
com! Spy     e ~/public_html/code.pyret.org/src/web/js/beforePyret.js
com! Trove   e ~/public_html/code.pyret.org/src/web/js/trove/image-lib.js
com! Wesed   e ~/public_html/wescheme2012/war-src/js/openEditor/editor.js
com! Wesj    e ~/public_html/wescheme2012/war-src/js/js-runtime/world/jsworld.js
