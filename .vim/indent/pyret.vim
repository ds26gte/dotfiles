" Vim indent file
" Language:	Pyret
" Maintainer:	Dorai Sitaram <ds26gte@yahoo.com>
" Last Change:	2015-05-06

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" Some preliminary setting
setlocal indentkeys=!,o,O,=case,=catch,=else,=elseif,=end

setlocal indentexpr=GetPyretIndent(v:lnum)

" Only define the function once.
if exists("*GetPyretIndent")
  finish
endif

let s:pyretIndentOpeners = '^\s*\(ask\|case\|cases\|catch\|check\|data\|else\|elseif\|for\|fun\|if\|switch\|try\|while\)\>'

let s:pyretIndentClosers = '^\s*\(case\|catch\|else\|elseif\|end\)\>'

function GetPyretIndent(lnum)
  let plnum = a:lnum - 1

  " Search backwards for the first non-empty line.
  while plnum > 0 && getline(plnum) =~ '^\s*$'
    let plnum = plnum - 1
  endwhile

  if plnum == 0
    " This is the first non-empty line, use zero indent.
    return 0
  endif

  let curind = indent(plnum)

  " If the current line is a stop-block statement...
  if getline(a:lnum) =~ s:pyretIndentClosers
    " See if this line does not follow the line right after an openblock
    if getline(plnum) =~ s:pyretIndentOpeners
    else
	let curind = curind - &sw
    endif
"  endif

  " If the previous line opened a block
  elseif getline(plnum) =~ s:pyretIndentOpeners
      let curind = curind + &sw
  endif

  " If we got to here, it means that the user takes the standardversion, so we return it
  return curind
endfunction
