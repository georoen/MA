DATE=$(date +%Y%m%d-%H%M)
#raspistill -o ./picam/picam-$DATE.jpg
wget -O now.jpg http://webcam.rockenstein.de/cam1g.jpg  # Wuecam
#wget -O now.jpg http://10.42.0.64/nph-jpeg.cgi  # Stardot

# Run YOLO
Rscript -e "wuepix::yolo_single('now.jpg')"
