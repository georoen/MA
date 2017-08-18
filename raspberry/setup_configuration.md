# Setup Configuration

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


## FTP Server
> FTP (File Transfer Protocol) can be used to transfer files between a Raspberry Pi and another computer. Although with default program sftp-server of Raspbian the users with sufficient privilege can transfer files or directories, access to the filesystem of the limited users is also required often. Follow the steps below to set up an FTP server.
> -- [raspberrypi.org](https://www.raspberrypi.org/documentation/remote-access/ftp.md)

Run (line by line):
```
sudo apt-get install pure-ftpd

groupadd ftpgroup
sudo groupadd ftpgroup
sudo useradd ftpuser -g ftpgroup -s /sbin/nologin -d /dev/null
sudo mkdir /home/pi/FTP
sudo chown -R ftpuser:ftpgroup /home/pi/FTP
sudo pure-pw useradd upload -u ftpuser -g ftpgroup -d /home/pi/FTP -m

sudo pure-pw mkdb
sudo ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb
sudo service pure-ftpd restart
```

FROM ubuntu TO `ftp://upload@raspberrypi.local` works.
FROM ubuntu TO `ftp://upload@10.42.0.10` works.
FROM stardot TO `ftp://upload@10.42.0.10` works.



## `.bashrc`
[Customized bash](.bashrc), uncomment last line vor VNC at login.

## R

[Install R on RaspberryPi 3](http://raspberrypi.stackexchange.com/a/55216)

1. add `deb http://archive.raspbian.org/raspbian/ stretch main` to `/etc/apt/source.list`.
2. `sudo apt-get update`
3. `sudo apt-get install r-base`

Installed Version: 3.3.2

**Install R-packages as root in case multiple users will access RasPi**

Change workingdirectory to `/hardware/raspberry` when developing code.
