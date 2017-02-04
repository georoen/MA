# Getting Started with RasperryPi with SSH only

## Prepare SD-Card
Download ISO-file from [here](https://www.raspberrypi.org/downloads/raspbian/) and write it to SD-Card.  

## Enable SSH
> For headless setup, SSH can be enabled by placing a file named 'ssh', without any extension, onto the boot partition of the SD card.
> -- https://www.raspberrypi.org/documentation/remote-access/ssh/

## First boot
Connect Raspberry via Ethernet-cable directly to Ubuntu laptop.
Find out it's IP-Adress following [this guide](http://raspberrypi.stackexchange.com/a/61004):

1. connect raspberry pi to laptop with Ethernet.
2. Go the edit connection setting. Navigate to ipv4 option. Select method : shared to other computer.
4. Open terminal and type: `cat /var/lib/misc/dnsmasq.leases`. You will get raspberry pi Ip from that.
5. Then connect typing: `ssh pi@[ip-adress]`


## Add to WIFI
Because next want to remove the Ethernet cable, we have to connect the RasPi with our local wifi, following [this documentation](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md).

1. scan available networks: `sudo iwlist wlan0 scan`
2. Append the network to the `wpa-supplicant` configuration file in nano: `sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`. 
3. `sudo reboot`
4. Reconnect using Ethernet-IP to see if wifi works by tpying: `ifconfig wlan0` and checking the `inet addr` field.