# Setup 2
As discussed with Johannes Schamel, Manuel Engelbauer and Niklas Scheder on 2.2.2016 internet is not always available in the field. They prefer an autoneus setup storing images locally. The setup should depend only on energy supply. The researchers would go into the field to collect the data.  



## Technical Concept
![](./setup2_concept.jpg)

IP Adresses:  
Stardot: 10.42.0.64  
Raspberry: 10.42.0.10  



## Digitaly Access Instument
### Mobile Hotspot
Use your smartphone to host a little wifi hotspot. Attention: `SSID` and `WPA-Key` have to be [configured on RaspberryPi](../raspberry/getting_started_ssh_only.md#add-to-wifi)!

### SSH + Portforwarding Stardot
Forward stardots web-backend to your local maschine (ubuntu laptop).  
Make sure `<startdor-ip>:80` (the configuration backend of stardot) is pingable from raspi. Now start [new ssh session](https://help.ubuntu.com/community/SSH/OpenSSH/PortForwarding#Local_Port_Forwarding) from laptop with `ssh -L 8080:10.42.0.64:80 pi@raspberrypi.local`. This will forward the stardot webinterface to your local maschiene.  
After loging into ssh open a browser and open `localhost:8080` -> should be the camera backend. (If you have troubles don't hestitate to contact me)  

If you want you can pull the current image to `now.jpg` by typing:
`wget -O now.jpg http://10.42.0.64/nph-jpeg.cgi`



## Configuration
### Archive Images via FTP
#### Stardot
The Stardot is comes with a full FTP client out of the box. Currently it's [configured](localhost:8080/admin.cgi?ftp&0) to push new images onto RaspberryPi every minute:  
![Screenshot](stardot_ftp.jpg)  

#### RaspberryPi
For handling large data archives easily, it is recomended to store the images in a chronological folder strucutre. See image above `Secondary Path/File`.  
CRON (this script)[../raspberry/CRON_Monthly-Folder-Structure.sh] every month (`@monthly ./software/CRON_Monthly-Folder-Structure.sh`) to `mkrdir ./YEAR/MONTH/` and grant `ftpuser` access to it.  

Note 8.5.17: Initial test (generate new folder `./2017/05/`) was not sucessfull. Runnig it from `sudo crontab` now.  
TODO beginn june: Check and update this line.


### Timeserver
#### Stardot
Enter [Stardot Backend -> Date/Time](http://localhost:8080/admin.cgi?datetime)
and set to `Automatic` with Raspberry IP-Adress.  

#### TODO: RasPi-RTC
Infos + Konfiguration. Hinweis zu Ersatzbaterien beachten: http://www.raspberry-pi-geek.de/Magazin/2015/03/Echtzeituhr-Modul-DS3231-sorgt-fuer-genaue-Zeitangaben  
Konfiguration: http://raspberrypi.tomasgreno.cz/ntp-client-and-server.html  
Amazon:  https://www.amazon.de/DIYMall-Raspberry-DS3231-Uhrzeit-Knopfzelle/dp/B0126GGFQI
