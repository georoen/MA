# Setup 2
As discussed with Johannes Schamel, Manuel Engelbauer and Niklas Scheder on 2.2.2016 internet is not always available in the field. They prefer an autoneus setup storing images locally. The setup should depend only on energy supply. The researchers would go into the field to collect the data.  



## Technical Concept
![Technical Concept of Setup 2](./setup2_concept.jpg)

IP Adresses:  
Stardot: 10.42.0.64  
Raspberry: 10.42.0.10  



## Access Instument
### Use a Mobile Hotspot
Use your smartphone to host a little wifi hotspot. Attention: `SSID` and `WPA-Key` have to be [configured on RaspberryPi](../raspberry/getting_started_ssh_only.md#add-to-wifi)!

### SSH + Portforwarding Stardot
Forward stardots web-backend to your local maschine (ubuntu laptop).  
Make sure `<startdor-ip>:80` (the configuration backend of stardot) is pingable from raspi. Now start [new ssh session](https://help.ubuntu.com/community/SSH/OpenSSH/PortForwarding#Local_Port_Forwarding) from laptop with `ssh -L 8080:10.42.0.64:80 pi@raspberrypi.local`. This will forward the stardot webinterface to your local maschiene.  
After loging into ssh open a browser and open `localhost:8080` -> should be the camera backend. (If you have troubles don't hestitate to contact me)  

To se if everything is connected poperly you can pull the current image via *wget* by typing `wget -O now.jpg http://10.42.0.64/nph-jpeg.cgi` into the terminal.



## Configuration
### Archive Images via FTP
For handling large data archives easily, it is recomended to store the images in a chronological folder strucutre. Therefore configure Stardot and Raspberry as follows.

#### Stardot
The Stardot is comes with a full FTP client out of the box and pushes new images onto the RaspberryPi. Currently it's [configured](localhost:8080/admin.cgi?ftp&0) to take a picture every minute (24/7) and write them into monthly folder.  

**TODOKU** Set secondary Path/File to `%Y/%m/Camera1_...`.  

**Attention:** The monthly folders have to already exist on the server, they will not be created automaticlly. Also make sure the ftpuser has writing rigths. Otherwise no images will be stored at all!  

![Screenshot FTP Configuration](stardot_ftp.jpg)  


#### RaspberryPi
As mentioned above it is obligatory to provide the monthly folder structure on the server side (raspberrypi). Therefore CRON [this script](../raspberry/CRON_Monthly-Folder-Structure.sh) every month (`@monthly sudo bash ../raspberry/CRON_Monthly-Folder-Structure.sh`). It will `mkrdir ./YEAR/MONTH/` and permit `ftpuser` to write files in it.  

Note 8.5.17: Initial test (generate new folder `./2017/05/`) was not sucessfull. Runnig it from `sudo crontab` now.  
Note 16.5.17: Testing crontab interdaily - now works with `sudo bash ...`  
Note 1.5.17: Monthly CRON worked  
Idea: Can ftpuser also execute crontabs? - then no struggle with sudo permission?


### Timeserver
Since we are doing time-series analyses the timestamps have to be accuate. In this case the timestamps are assigned by the camera when taking the picture. It defines the filename (See above Stardot configuration) and is printed to the uper left corner of every image.  Consequently the camera has to know the accurate time. While the devices are connected to the internet they will be able to set their clocks correctly using NTP.

**Attention:**  Unfortunatly the two devices both trust on online timeservers only. When rebooting the instument in an offline enviroment they can not sync with timeservers and the timestamps will be wrong. Instead they continue with the date they had been shutdown making it very hard to retroactivly identify the temporal gap.

**Solution:** For operating in an offline enviroment a pysical clock is necessary. A *real time clock* (RTC) module with a standalone battery has to be attached to the RaspberryPi. Then the camera is configured to trust on the raspis time and the images are named accurate.

#### Stardot
Enter [Stardot Backend -> Date/Time](http://localhost:8080/admin.cgi?datetime), toogle `Automatic` and enter ip-adress of RaspberryPi.  

**TODOKU:** Insert Screenshot

#### RaspberryPi
**TODO:**
Infos + Konfiguration. Hinweis zu Ersatzbaterien beachten: http://www.raspberry-pi-geek.de/Magazin/2015/03/Echtzeituhr-Modul-DS3231-sorgt-fuer-genaue-Zeitangaben  
Konfiguration: http://raspberrypi.tomasgreno.cz/ntp-client-and-server.html  
Amazon:  https://www.amazon.de/DIYMall-Raspberry-DS3231-Uhrzeit-Knopfzelle/dp/B0126GGFQI


## Powersupply
In rought field conditions, with no electricty network around, it should also be possible to operate with solar and batteries.


### Energiebedarf
Stardot	12V * 0.5A  
RasPi	 5V * 1A  

### Solar
#### Sonnenstunden
https://www.wetter.de/klima/europa/deutschland-c49.html  
https://de.statista.com/statistik/daten/studie/249925/umfrage/sonnenstunden-im-jahr-nach-bundeslaendern/  

#### Emails Josef


### Baterien

### Sonstiger Schnickschnack
