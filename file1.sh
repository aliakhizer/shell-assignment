#!/bin/bash

path=""
filename="wallpaper"
resolution="4096/2160"
tmp=false
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -p PATH      Save image to a specific PATH (default: current folder)"
    echo "  -t           Save image in /tmp (default: current folder)"
    echo "  -o FILENAME  Specify the FILENAME (default: wallpaper)"
    echo "  -r RES       Set custom RESOLUTION (e.g., -r 1920x1080)"
    echo "  -? or -h     Show this usage information"
    exit 1
}


while getopts ":p:to:r:?" opt; do
    case $opt in
     
        p)
            path="$OPTARG"
            ;;
        t)
            tmp=true
            ;;
        o)
            filename="$OPTARG"
            ;;
        r)
            resolution="$OPTARG"
            ;;
        ?|h)
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            usage
            ;;
    *) 
            echo "Invalid option: -$OPTARG"
            usage
            ;;
    esac
done

downloadAt=""
if [ -n "$path" ]; then
echo "i am here path $path"
  downloadAt="$path/$filename.jpg"
elif [ "$tmp" = true ]; then
  mkdir tmp
  downloadAt="./tmp/$filename.jpg"
else
  downloadAt="./$filename.jpg"
fi
wget -O "$downloadAt" "https://picsum.photos/$resolution"
   



   
    



