


# Prepare SD-Card
Download ISO-file from [here](https://www.raspberrypi.org/downloads/raspbian/) and write it to SD-Card.  


## Operating System
*Raspbian* is a free operating system optimized for the Raspberry Pi hardware. This *Debian* based *Linux* is has a big online community, is well tested and thousands available packages using *apt*.  
Here we downloaded the latest [*Raspbian Jessie Lite*](https://www.raspberrypi.org/downloads/raspbian/), released on 11th January 2017 with kernel version 4.4. I choose the lite version without the *PIXEL desktop* to save unnecessary disk space for archiving images. After writing the iso-image on the SD-Card using [Ubuntu's USB-Creator](https://wiki.ubuntuusers.de/Live-USB/#USB-Creator-Startmedienersteller).  


## Enable SSH
> For headless setup, SSH can be enabled by placing a file named 'ssh', without any extension, onto the boot partition of the SD card.
> -- https://www.raspberrypi.org/documentation/remote-access/ssh/


## First boot
### connect via router (DCHP)
See [how to use hostnames](https://unix.stackexchange.com/questions/16890/how-to-make-a-machine-accessible-from-the-lan-using-its-hostname)  
`ssh pi@raspberrypi.local` 


### connected via cable
**No access to router:**Connect Raspberry via Ethernet-cable directly to Ubuntu laptop.
Find out it's IP-Adress following [this guide](http://raspberrypi.stackexchange.com/a/61004):

1. connect raspberry pi to laptop with Ethernet.
2. Go the edit connection setting. Navigate to ipv4 option. Select method : shared to other computer.
4. Open terminal and type: `cat /var/lib/misc/dnsmasq.leases`. You will get raspberry pi Ip from that.
5. Then connect typing: `ssh pi@[ip-adress]`

## Initial configuration
For initial configurations open the [Raspberry Pi configuration tool](https://www.raspberrypi.org/documentation/configuration/raspi-config.md) as superuser: `sudo raspi-config`.  

### Password
See `Passwords.md` (Obvious not in Git)  

### Locale
1. Choose `4 Internationalisation Options`
2. ~~Change Locale to German UTF8~~ I'm fine with english
3. Change Timezone to Europe/Berlin
4. Change Wi-fi Country to `DE Germany`

### Update
As seen with the failed Telekom-Hack the internet-of-things is tageted  by botnets. An up-to-date system prevents harm to the system and others. To close latest exploits update the system by typing `sudo apt update` followed by `sudo apt upgrade`.



## Add to WIFI
Next connect the RasPi to our local wifi, following [this documentation](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md). Than remove the ethernet cable.

1. scan available networks: `sudo iwlist wlan0 scan`
2. Append the network to the `wpa-supplicant` configuration file in nano: `sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`. 
``
network={  
    ssid="testing"  
    psk="testingPassword"  
}  
``
3. `sudo reboot`
4. Reconnect using Ethernet-IP to see if wifi works by tpying: `ifconfig wlan0` and checking the `inet addr` field.

## Passwordless SSH access
> It is possible to configure your Pi to allow your computer to access it without providing a password each time you try to connect. To do this you need to generate an SSH key.  
> --[raspberrypi.org](https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md)  

Use this keys for github ;-)

## Duplicate SD-Image
Identical configuration for both RasPis...  

1. Place configured RasPis SD-Card in Laptop. Create Image
2. Place empty SD-Card into laptop. Write Image

The images also specify the disc size. To make the rest of the 64GB available for files it has to be expanded. Make sure the sd-image is completly pre-comfigrured before next steps (after expanding the image as created above will be 64GB no matter how many disc-capacity acctually is used!)

1. Place pre-configured image in RasPi and boot
2. `sudo raspi-config`
3. **Expand Filesystem**
4. `reboot`

**TODO: Change hostname raspberrypi**

## VNC
Installation
```
sudo raspi-config
select Advanced Options
select VNC

sudo apt-get install tightvncserver
tightvncserver
```

CRON
`@reboot tightvncserver:1`


## Fix IP
```
sudo nano /etc/network/interfaces

 auto eth0
 iface eth0 inet static
 #your static IP
 address 192.168.10.118
 #your gateway IP
 gateway 192.168.10.1
 netmask 255.255.255.0
 #your network address "family"
 network 192.168.10.0
 broadcast 192.168.10.255
```