![Logo](./extra/Sticker_UniWue-Scientific-Instrument.jpg)

This git is part of the master degree project by Jeroen Staab. As long as the thesis is evaluated, you can find the initial proposal [here](./extra/STAAB_Proposal_AutomatisiertPassantenZählen.pdf).

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


## Setup 0 (DEPRECATED)
Stream images from public available [webcam](http://webcam.rockenstein.de/cam1g.jpg). Processing only.

TODO: App script to GIT.  
TODO: Strucutre data into new folder per month.

## [Setup 1](./1_setup/README.md)
Camera with Internet in field and sending images to RaspberryPi processing images remotely.



## [Setup 2 (Active)](./2_setup/README.md)
Works without Internet. Camera and raspberry placed in weatherproof enclosure, Needs power-supply only. Collect data periodically (SD-Card / FTP in wlan0).  

Works: Static IP form stardot + raspi (via eth0, dhcp `raspberrypi.local` via wlan0).  
Works: Configure cameras by port forwaring to `localhost:8080` when connecting via ssh.  


TODO: Use realtimeclock



## [Setup 3 (BETA)](./3_setup/README.md)
Analise images instantly, in accordance to circumvent legal issues.
