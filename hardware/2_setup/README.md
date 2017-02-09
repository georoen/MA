# Setup 2
As discussed with Johannes Schamel, Manuel Engelbauer and Niklas Scheder on 2.2.2016 internet is not always available in the field. They prefer an autoneus setup storing images locally. The setup should depend only on energy supply. The researchers would go into the field to collect the data.  

**Therefore we need a RTC for RasPi!!**

## Technical Concept
![](./setup2_concept.jpg)

## Fix Ip for Raspberry
At the begin I struggeld with the static IP, but after reading [this wiki](https://wiki.ubuntuusers.de/interfaces/#Statische-IP-Konfiguration) everything works, incl. FTP. This is how to configure `/etc/network/interfaces` eth0 part:  
```
auto eth0
allow-hotplug eth0
iface eth0 inet static
    address 10.42.0.10   
    netmask 255.255.255.0  
    gateway 10.42.0.1
```

## Data Transfer
### Push via FTP
Currently the Stardot is on `10.42.0.54`. Connecting via vnc works. Configure and test FTP:
![Screenshot](stardot_ftp.jpg)

### Pull via `wget`
Current image at static adress.  
`wget -O now.jpg http://10.42.0.64/nph-jpeg.cgi`

## ToDo
### Portforwarding Camera
 
 
###Use RasPi as timeserver for Stardot
