# Setup 2
As discussed with Johannes Schamel, Manuel Engelbauer and Niklas Scheder on 2.2.2016 internet is not always available in the field. They prefer an autoneus setup storing images locally. The setup should depend only on energy supply. The researchers would go into the field to collect the data.  

**Therefore we need a RTC for RasPi!!**

## Technical Concept
![](./setup2_concept.jpg)

1. Connect RasPi w. Stardot via LAN
2. Fix IP?
3. PortForwarding 

**Use RasPi as timeserver for Stardot**

## Wget current image
`wget -O now.jpg http://10.42.0.64/nph-jpeg.cgi`1

