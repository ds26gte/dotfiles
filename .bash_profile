# last modified 2021-11-28
# Dorai Sitaram

. $HOME/.bashrc

if which setxkbmap > /dev/null; then
  /usr/bin/setxkbmap -option "ctrl:nocaps"
  /usr/bin/setxkbmap -option "compose:ralt"
fi
