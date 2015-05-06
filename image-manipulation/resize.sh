SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

mkdir small
for s in *; do
    echo "$s"
    convert -resize 30% "$s" "small/$s"
done

IFS=$SAVEIFS
