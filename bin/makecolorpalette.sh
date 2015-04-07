# last modified 2015-04-07

makepalettefile() {
    f=$1ctermcolors.vim
    rm -f $f
    for i in {1..255}
    do
        j=$(printf "%02x" $i)
        echo hi def $1cterm$j cterm$1g=$i
        echo syn keyword $1cterm$j $1cterm$j
    done >> $f
    echo au bufread $f so % >> $f
}

for f in f b
do
    makepalettefile $f
done
