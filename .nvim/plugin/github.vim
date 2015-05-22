" last modified 2015-02-11

au bufread,bufnewfile *.md call s:github_options()

func! s:github_options()
  doau bufread pretend.txt

  let b:special_typography = 'GitHub_compatible'

  setl mp=pandoc
        \\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris
        \\ -t\ html5
        \\ -c\ default.css
        \\ -s
        \\ %
        \\ -o\ %:r.html
endfunc

func! GitHub_compatible()
  " no need for more than 2 trailing spaces
  %s: \{3,}$:  :
  " remove all trailing u+00a0s
  %s: \+$::
  " for nonflushleft lines
  " ensure leading space is real space, not u+00a0
  %s:^ : :
  " and add 2 trailing spaces after
  %s:^ \(.*\S\) \{0,1}$: \1  :
  " for flushleft (and displayed code) lines, remove all trailing space
  g:^\S: s:[  ]\+$::
  " for blank lines, remove all space
  %s:^[  ]\+$::
  " convert all but 1st leading space to u+00a0
  %s:\%(^ [  ]*\)\@<= : :g
  " convert all internal u+00a0s to regular spaces
  %s:\%([^  ].*\)\@<= : :g
  " code displays don't need trailing spaces
  g:^ÞtzpPreformattedTzp: s:[  ]\+$::
endfunc
