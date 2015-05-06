SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for s in *
do
  echo $s
  name=`basename $s .mkv`

  subline=`mkvmerge -i "$s" | grep subtitles`
  i="${subline:9:1}"

  # vidline=`mkvmerge -i "$s" | grep video`
  # j="${vidline:9:1}"

  # audioline=`mkvmerge -i "$s" | grep audio`
  # k="${audioline:9:1}"

  mkvextract tracks "$s" "$i:$name.ssa"
  # avconv -i "$s" -codec copy -sn "../mp4/`basename $s .mkv`.mp4"
  # ffmpeg -i "$s" -vcodec msmpeg4 -b 24576k -s hd480 -ab 128k -ac 2 "../mp4/$name.avi"
  # MP4Box -add "../mp4/$name.h264" -add "../mp4/$name.aac" "../mp4/$name.mp4"

done
IFS=$SAVEIFS



SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for s in *
do
  echo $s
  mkvextract tracks "$s" 1:"../mp4/$name.h264" 2:"../mp4/$name.aac" 3:"../mp4/$name.srt"
  MP4Box -fps 24 -add "../mp4/$name.h264" -add "../mp4/$name.aac" "../mp4/$name.mp4"
done
IFS=$SAVEIFS


for s in `ls`; do
  eval a=\$$s
  echo $a
done



SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for s in *
do
  echo $s
  name=`basename $s .MTS`
  ffmpeg -i "$s" -strict experimental "../$name.mp4"
  # ffmpeg -i "$s" -b 750000 -strict experimental "../$name.mp4"
done
IFS=$SAVEIFS
