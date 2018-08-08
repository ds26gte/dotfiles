# last change 2018-08-20

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

. ~/.env

. ~/.aliases

if test "$VIM" = "" -a "$TERM" != tmux-256color; then
  tmux new -s $USER-$$
  exit
fi
