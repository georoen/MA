# Setup 3
To activate live analyses

1. Install the *wuepix* package and its dependencies.  
> [Install R](../raspberry/setup_configuration.md#R)  
> `sudo apt-get install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev r-cran-curl r-cran-httr` (Dependencies for devtools)  
> Start `R`, then  
> `install.packages("devtools")`  
> `devtools::install_github("georoen/wuepix")`  
> `wuepix::yolo_install("~/YOLO")`  for YOLO CNN. (During compilation [VI-editor](http://org.netbase.org/vi.html) will open to configure flags.)


2. Configure [this](./takeImage.sh) script accordingly. I.e. `yolo_single()`

3. Put `bash takeImage.sh` in crontab. E.g. minutely  
> `* * * * * bash ~/takeImage.sh`
