# RaspberryPi 3
> The Raspberry Pi Foundation is a charity. All the money we make from selling computers, cases, cameras, and other products goes straight into our charitable fund to train teachers, provide free learning resources, teach kids, help build the foundations of digital making in schools, and much more.
> -- [Official RaspberryPi website](www.raspberrypi.org/)


## [Getting started](./getting_started_ssh_only.md)
**Getting Started with SSH only**  
I don't have an external screen and get started using SSH only..  


## **Fix IP Adress**
https://www.elektronik-kompendium.de/sites/raspberry-pi/1912151.htm

Raspberry 1 IP:`192.168.10.1`

## FTP Server
> FTP (File Transfer Protocol) can be used to transfer files between a Raspberry Pi and another computer. Although with default program sftp-server of Raspbian the users with sufficient privilege can transfer files or directories, access to the filesystem of the limited users is also required often. Follow the steps below to set up an FTP server.  
> -- [raspberrypi.org](https://www.raspberrypi.org/documentation/remote-access/ftp.md)


## R

[Install R on RaspberryPi 3](http://raspberrypi.stackexchange.com/a/55216)

1. add `deb http://archive.raspbian.org/raspbian/ stretch main` to `/etc/apt/source.list`.
2. `sudo apt-get update`
3. `sudo apt-get install r-base`

Installed Version: 3.3.2

**Install R-packages as root in case multiple users will access RasPi**

Change workingdirectory to `/hardware/raspberry` when developing code.  


### [Twitterbot](./tools/twitterbot.md)
Receive status updates via Twitter.