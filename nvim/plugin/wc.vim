" last modified 2018-08-17
" Dorai Sitaram

" WordCount() shows the length of the text in the current buffer.

" The length is shown in one of three formats:
" - number of words, e.g, 930
" - minutes and seconds, e.g., 7'30"
" - degrees rotated by the Earth during the speech, e.g., 1.875 deg

" The variable g:wcFormat governs which format is chosen.

"let g:wcFormat = 'words'
let g:wcFormat = 'minutes'
"let g:wcFormat = 'degrees'

" Note that the earth rotates 1 degree in 4 (clock) minutes.

" I assume ~124 words are spoken per minute. You can change this.

let g:wordsSpokenPerMinute = 124

func! WordCount()
  let l:words = wordcount().words
  if g:wcFormat == 'words'
    return printf("%dw", l:words)
  else
    let l:minutes = round(l:words) / g:wordsSpokenPerMinute
    if g:wcFormat == 'minutes'
      let l:wholeMinutes = float2nr(l:minutes)
      let l:seconds = float2nr((l:minutes - l:wholeMinutes) * 60)
      return printf("%d'%02d\"", l:wholeMinutes, l:seconds)
    elseif g:wcFormat == 'degrees'
      let l:earthDegrees = l:minutes / 4
      return printf("%.2f deg", l:earthDegrees)
    endif
  endif
endfunc

com! Talk echo WordCount()

nmap <leader>t :Talk<return>
