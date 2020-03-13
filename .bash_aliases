# last change 2020-03-13

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

. ~/src/dotfiles/.env

. ~/src/aliases/.aliases

if test ! -d /gpfs -a \
  ! -d /sdcard -a  \
  "$VIM" = "" -a \
  "$TERM" != tmux-256color; then
  tmux new -s t$$
  #exit
fi
