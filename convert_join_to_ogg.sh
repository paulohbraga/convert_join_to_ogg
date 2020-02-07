
for folder in folders/*; do
    echo $(basename $folder)
    for file in $folder/*.ogg; do
        echo "file '$(basename $file)'" >> folders/$(basename $folder)/$(basename $folder).txt
    done
    ffmpeg -f concat -safe 0 -i folders/$(basename $folder)/$(basename $folder).txt -c:a libvorbis -ab 32k -ar 22050 folders/$(basename $folder)/$(basename $folder).ogg #>>/dev/null 2>&1
done