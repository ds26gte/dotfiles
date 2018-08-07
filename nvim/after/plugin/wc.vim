" Last modified 2018-08-01
" Dorai Sitaram

" Wordcount() shows the length of the text in the current buffer.

" The length is shown in one of three formats:
" - number of words, e.g, 930
" - minutes and seconds, e.g., 7'30"
" - degrees rotated by the Earth during the speech, e.g., 1.875 deg

" The variable g:wc_format governs which format is chosen.

"let g:wc_format = 'words'
let g:wc_format = 'minutes'
"let g:wc_format = 'degrees'

" Note that the earth rotates 1 degree in 4 (clock) minutes.

" I assume ~124 words are spoken per minute. You can change this.

let g:words_spoken_per_minute = 124

func! Wordcount()
  let l:words = wordcount().words
  if g:wc_format == 'words'
    return printf("%dw", l:words)
  else
    let l:minutes_f = round(l:words) / g:words_spoken_per_minute
    if g:wc_format == 'minutes'
      let l:minutes = float2nr(l:minutes_f)
      let l:seconds = float2nr((l:minutes_f - l:minutes) * 60)
      return printf("%d'%02d\"", l:minutes, l:seconds)
    elseif g:wc_format == 'degrees'
      let l:earthdegrees = l:minutes_f / 4
      return printf("%.2f deg", l:earthdegrees)
    endif
  endif
endfunc

com! Talk echo Wordcount()

nmap <leader>t :Talk<return>
