![Logo](./extra/Sticker_UniWue-Scientific-Instrument.jpg)

This git is part of a master degree project by Jeroen Staab. You can find the initial proposal (Deutsch) [here](./extra/STAAB_Proposal_AutomatisiertPassantenZählen.pdf).

# Hardware

## [Stardot Camera](./stardot/README.md)
Here we use two stardot webcameras. They are boradly used in eviromental outdoor sciences [@ Richardson, Harvard]. Temperature ranges from -40C° to +48C° are no problem [@ Stardot Handbook].  

There are two ways to configure the camera. The first is also the recomended one - use a browser to access the web-backend via *http*. Alternativly you could also access the camera via *telnet*, *SSH* is not supported.

Works: FTP upload images to upload@raspberrypi.local via wlan0 from laptop.  
Works: FTP upload images to upload@10.42.0.10 via eth0 from stardot.  
Works: Use Raspi as Timeserver.  
Optional: RGB+IR configuration. See EURAC archiv.zip  

**TODO: Find best camera position**

## [Raspberry Pi](./raspberry/README.md)
Works: Static IP  
Works: FTP Server  
TODO: Configure Raspi Nr. 2


## Setup 0 (Background)
Stream images from public available [webcam](http://webcam.rockenstein.de/cam1g.jpg). Processing only.

TODO: App script to GIT.  
TODO: Strucutre data into new folder per month.

## [Setup 1](./1_setup/README.md)
Camera with internet in field. Raspberry processing images remotely.  

TODO w. Simon: Upload from Stardot into UniWue-network without VPN. Raspi inside University (FTP from outside without VPN, because stardot without openvpn)


## [Setup 2 (Active)](./2_setup/README.md)
Autonomos setup without internet. Camera and raspberry in case, powersupply only. Collect data peridically (SD-Card / FTP in wlan0).  

Works: Static IP form stardot + raspi (via eth0, dhcp `raspberrypi.local` via wlan0).  
Works: Configure cameras by port forwaring to `localhost:8080` when connecting via ssh.  
Optional: [Platzsparendes LAN Kabel](https://www.conrad.de/de/rj45-netzwerk-anschlusskabel-cat-5e-sftp-050-m-grau-delock-1298118.html)? 1:1 verdahtet?

**TODO: Use realtimeclock**  
**TODO: Solve powersupply question: 230V, 12V or PoE?**  


# Troubleshoot
Reboot camera when working with ethernet cable.
