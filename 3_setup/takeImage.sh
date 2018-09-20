# Live Processing Images with YOLO

# Parameters
cam="img_"
url="http://webcam.rockenstein.de/cam1g.jpg"  # Wuecam
#url="http://10.42.0.64/nph-jpeg.cgi"  # Stardot

# Record Image from Source
FILE=$cam_\$(date +%Y%m%d-%H%M).jpg
wget -O $FILE $url  # Webcam
#raspistill -o $FILE  # PiCam

# Run YOLO
Rscript -e "wuepix::yolo_single('"$FILE"')"

# Remove file
rm $FILE
