# last modified 2014-08-09

makepalettefile() {
    f=$1xterm256colors.vim
    rm -f $f
    for i in {1..255}
    do
        echo hi def $1xterm$i cterm$1g=$i
        echo syn keyword $1xterm$i $1xterm$i
    done >> $f
    echo au bufread $f so % >> $f
}

for f in f b
do
    makepalettefile $f
done
