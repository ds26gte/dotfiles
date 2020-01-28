# last change 2020-01-30

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

. ~/src/dotfiles/.env

. ~/src/aliases/.aliases 2>/dev/null

if test ! -d /gpfs -a \
  ! -d /sdcard -a  \
  "$VIM" = "" -a \
  "$TERM" != tmux-256color; then
  tmux new -s t$$
  #exit
fi
