# last change 2019-10-07

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

. ~/src/dotfiles/.env

. ~/src/dotfiles/.aliases

if test ! -d /gpfs -a \
  ! -d /sdcard -a  \
  "$VIM" = "" -a \
  "$TERM" != tmux-256color; then
  tmux new -s T$$
  #exit
fi
