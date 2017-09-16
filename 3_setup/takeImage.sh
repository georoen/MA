FILE=img_$(date +%Y%m%d-%H%M).jpg
#raspistill -o $FILE
wget -O $FILE http://webcam.rockenstein.de/cam1g.jpg  # Wuecam
#wget -O $FILE http://10.42.0.64/nph-jpeg.cgi  # Stardot

# Run YOLO
Rscript -e "wuepix::yolo_single('"$FILE"')"

# Remove file
rm $FILE
