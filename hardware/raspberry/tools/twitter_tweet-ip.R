#' Make PaspberryPi post status to twitter
#' This twitterbot allows to actually stay in touch with the instrument.
#' Run this script at reboot, to be informed about IP adress
#' Opt-In crontab



# Init API
keyfile <- "./tools/twitter_credentials.R"
source(keyfile)

library(twitteR)
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)



# Compose Tweet
## make system(intern = TRUE) default
system <- function(...)
  base::system(intern = TRUE, ...)

## Where am I ?
hostname <- system("cat /etc/hostname")
## Time
#Debug error 403: Tweets have to be unique. https://github.com/geoffjentry/twitteR/issues/62
time <- Sys.time()
## Connection 
ip <- system("ip route get 8.8.8.8")  # IP-Adress
ip <- strsplit(ip, " ")[[1]][c(3,5,8)]


# Tweet 🚀
msg <- paste(hostname, ":", time, ip)  
tweet(msg)