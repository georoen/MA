
# Setup 1
The initial setup trusts on the Stardot camera being connected to the Internet all the time. This is the case when it's mounted to building and connected to the local router and the advantages of Stardot Netcam SC come into play.  
This setup is comparable to the *weucam* concept.  


## Technical Concept
The camera comes with integrated web technologies and uploads new images to a server via *File Transfer Protocol* (FTP) periodically. As discussed with Simon Sebold (IT manager at LSFE) the server could be either a RasPi integrated within the UniWü network or a VM.   
![](./setup1_concept.jpg)





### Integrate in UniWü Network
If the RasPi is behind a firewall, as it is the case within the university network, it can not interact with the camera being mounted in the field. Therefor an according exception has to be setup by the university's ICT department, port-forwarding the FTP requests.
