# last change 2014-08-12
# vi:tw=0

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

# in ~/.inputrc put
# set completion-ignore-case on

export PATH=.:$PATH

. ~/.env

. ~/.aliases
