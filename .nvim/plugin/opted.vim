" opted.vim
" Dorai Sitaram
" Last Change: 2015-02-19

" Plugin for consulting the Online Plain Text English Dictionary
" (http://www.mso.anu.edu.au/~ralph/OPTED).

let s:opted_dir = expand("<sfile>:h:h") . "/opted"

func! s:opted_html_to_txt(in, out)
  exec 'e ' . a:out
  setl ma
  0,$d
  exec 'r ' . a:in
  0i
! The Online Plain Text English Dictionary, OPTED, v0.03,
! compiled by Ralph S. Sutherland, http://www.mso.anu.edu.au/~ralph/OPTED,
! from the Project Gutenberg etext of
! the 1913 edition of Webster's Unabridged Dictionary

.
  g#^</\?[HTMB]#d
  %s#</\?B>#*#g
  %s#^<P>#\r#g
  %s#</\?[PI]>##g
  0
  norm }VGgq
  sil! w
  bd
endfunc

func! s:make_opted_txt_files()
  let currdir = getcwd()
  exec "lcd " . s:opted_dir
  let more_sav = &more
  set nomore
  sil! e wb1913_start.txt
  setl ma
  0,$d
  i
  You have opened the Online Plain Text English Dictionary (OPTED).
  Use Vim tag commands (:help tag) to search for headwords in this window.
  For example,     :tj lexicon
            or     :tj /lexicon
.
  0
  sil! w

  !wget http://www.mso.anu.edu.au/~ralph/OPTED/v003/wb1913_{a..z}.html
  let htmlfiles = glob("wb1913_*.html", 0, 1)
  for htmlfile in htmlfiles
    let txtfile = substitute(htmlfile, "\.html$", ".txt", "")
    echo "Converting " . htmlfile . " to " . txtfile . " ..."
    sil! call s:opted_html_to_txt(htmlfile, txtfile)
  endfor

  b wb1913_start.txt
  sil! helptags %:p:h
  bd

  let &more = more_sav
  exec 'lcd ' . currdir
endfunc

func! Browse_opted()
  let copacetic_p = 0
  if !isdirectory(s:opted_dir)
    call mkdir(s:opted_dir)
  endif
  if !filereadable(expand(s:opted_dir . "/wb1913_a.txt"))
    call s:make_opted_txt_files()
    if !filereadable(expand(s:opted_dir . "/wb1913_a.txt"))
      let copacetic_p = 0
    endif
  else
    let copacetic_p = 1
  endif
  if !copacetic_p
    return
  endif
  exec "tabe " . s:opted_dir . "/wb1913_start.txt"
endfunc

nmap gm :call Browse_opted()<cr>:tj<space>

au bufread wb1913_*.txt call s:opted_txt_options()

let s:dict_buf_nr = 0

func! s:delete_prev_opted_buf()
  if s:dict_buf_nr > 0
    let w = bufwinnr(s:dict_buf_nr)
    if w > 0
      let b = winbufnr(w)
      if b > 0
        exec 'bd ' . b
      endif
    endif
  endif
endfunc

func! s:opted_txt_options()
  setl bh=wipe
  setl ft=help
  setl noma
  tabdo call s:delete_prev_opted_buf()
  let s:dict_buf_nr = bufnr("%")
endfunc
