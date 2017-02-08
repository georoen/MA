#' Make PaspberryPi post status to twitter
#' This twitterbot allows to actually stay in touch with the instrument.
#' Run this script at reboot, to be informed about IP adress
#' Opt-In crontab


# Init API
keyfile <- "./tools/twitter_credentials.R"
source(keyfile)

library(twitteR)
print(Sys.time())  # Log timestamp in strout
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)



# Compose Tweet
## make system(intern = TRUE) default
system <- function(...)
  base::system(intern = TRUE, ...)

## Where am I ?
hostname <- system("cat /etc/hostname")
## Time
time <- format(Sys.time(), "%j%H%M")
## Connection 
ip <- system("hostname -I")  # IP-Adress
print(ip)


# Tweet
msg <- paste0(hostname, "\n", ip)  

check <- try(tweet(msg))
if(class(check) == "try-error"){
  # Debug error 403 try again
  # Tweets have to be unique. https://github.com/geoffjentry/twitteR/issues/62
  msg <- paste0(msg, "\n", time)
  tweet(msg)
}
