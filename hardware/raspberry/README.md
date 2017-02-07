## RaspberryPi 3
> The Raspberry Pi Foundation is a charity. All the money we make from selling computers, cases, cameras, and other products goes straight into our charitable fund to train teachers, provide free learning resources, teach kids, help build the foundations of digital making in schools, and much more.
> -- [Official RaspberryPi website](www.raspberrypi.org/)


### Operating System
*Raspbian* is a free operating system optimized for the Raspberry Pi hardware. This *Debian* based *Linux* is has a big online community, is well tested and thousands available packages using *apt*.  
Here we downloaded the latest [*Raspbian Jessie Lite*](https://www.raspberrypi.org/downloads/raspbian/), released on 11th January 2017 with kernel version 4.4. I choose the lite version without the *PIXEL desktop* to save unnecessary disk space for archiving images. After writing the iso-image on the SD-Card using [Ubuntu's USB-Creator](https://wiki.ubuntuusers.de/Live-USB/#USB-Creator-Startmedienersteller).  


### Access via SSH

**Getting Started with SSH only**
I don't have an external screen and get started using SSH only. Please see this [dedicated post](./raspberry/getting_started_ssh_only.md).  


### Initial configuration
For initial configurations open the [Raspberry Pi configuration tool](https://www.raspberrypi.org/documentation/configuration/raspi-config.md) as superuser: `sudo raspi-config`.  

#### Password
See `Passwords.md` (Obvious not in Git)  

#### Locale
1. Choose `4 Internationalisation Options`
2. ~~Change Locale to German UTF8~~ I'm fine with english
3. Change Timezone to Europe/Berlin
4. Change Wi-fi Country to `DE Germany`

#### Update
As seen with the failed Telekom-Hack the internet-of-things is tageted  by botnets. An up-to-date system prevents harm to the system and others. To close latest exploits update the system by typing `sudo apt update` followed by `sudo apt upgrade`.


### Software

#### **Fix IP Adress**


### FTP Server
https://raspberry.tips/server-2/raspberry-pi-als-ftp-server-betreiben/



### R


[Install R on RaspberryPi 3](http://raspberrypi.stackexchange.com/a/55216)

1. add `deb http://archive.raspbian.org/raspbian/ stretch main` to `/etc/apt/source.list`.
2. `sudo apt-get update`
3. `sudo apt-get install r-base`

Installed Version: 3.3.2

**Install R-packages as root in case multiple users will access RasPi**

Change workingdirectory to `/hardware/raspberry` when developing code.  


### Duplicate SD-Image
Identical configuration for both RasPis...  

1. Place configured RasPis SD-Card in Laptop. Create Image
2. Place empty SD-Card into laptop. Write Image

The images also specify the disc size. To make the rest of the 64GB available for files it has to be expanded. Make sure the sd-image is completly pre-comfigrured before next steps (after expanding the image as created above will be 64GB no matter how many disc-capacity acctually is used!)

1. Place pre-configured image in RasPi and boot
2. `sudo raspi-config`
3. **Expand Filesystem**
4. `reboot`

**TODO: Change hostname raspberrypi**