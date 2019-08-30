# last change 2019-08-30

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

. ~/.env

. ~/.aliases

if test ! -d /gpfs -a  "$VIM" = "" -a "$TERM" != tmux-256color; then
  tmux new -s $USER-$$
  exit
fi
