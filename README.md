![Logo](./extra/Sticker_UniWue-Scientific-Instrument.jpg)

This git is part of a master degree project by Jeroen Staab. You can find the initial proposal (Deutsch) [here](./extra/STAAB_Proposal_AutomatisiertPassantenZählen.pdf).

# Hardware

## [Stardot Camera](./stardot/README.md)
Here we use two stardot webcameras. They are boradly used in eviromental outdoor sciences [@ Richardson, Harvard]. Temperature ranges from -40C° to +48C° are no problem [@ Stardot Handbook].  

Works: FTP upload images to upload@raspberrypi.local via wlan0 from laptop.
Works: FTP upload images to upload@10.42.0.10 via eth0 from stardot.  
**TODO: EURAC IR-configuration. See archiv.zip + speak Enrico+Abraham. How to ssh stardot?**  


## [Raspberry Pi](./raspberry/README.md)
Works: Static IP  
Works: FTP Server


## [Setup 1](./1_setup/README.md)
Camera with internet in field. Raspberry processing images remotely.  
**TODO w. Simon: Upload from Stardot into University without VPN. Raspi inside University (FTP from outside without VPN, because stardot without openvpn)**


## [Setup 2 (Active)](./2_setup/README.md)
Autonomos setup without internet. Camera and raspberry in case, powersupply only. Collect data peridically (SD-Card / FTP in wlan0).  

Works: Static IP form stardot + raspi (via eth0, dhcp `raspberrypi.local` via wlan0).
Solved: Configure cameras via ssh by port forwaring to `localhost:8080`.

**TODO/BUY: Use realtimeclock + make timeserver for Stardot**  
**Powersupply: 230V, 12V or PoE?**
**[Platzsparendes LAN Kabel](https://www.conrad.de/de/rj45-netzwerk-anschlusskabel-cat-5e-sftp-050-m-grau-delock-1298118.html) 1:1 verdahtet?**

# Troubleshoot
Reboot camera when working with ethernet cable.
