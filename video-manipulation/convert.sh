SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

mkdir result
for s in *; do
    echo "$s"
    avconv -i "$s" -qscale 7 -strict experimental "result/$s"
    mkvextract tracks "$s" 3:"result/$s.ssa"
done

IFS=$SAVEIFS
