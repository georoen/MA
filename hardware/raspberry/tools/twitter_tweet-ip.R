library(twitteR)


# Log into API
consumer_key <- xxxxxxx
consumer_secret <- xxxxxxx
access_token <- xxxxxxx
access_secret <- xxxxxxx
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)



# Compose Tweet
# Tweets have to be unique (Else error 403). https://github.com/geoffjentry/twitteR/issues/62
prefix <- Sys.time() #"IP-Adress:"
ip <- system("ip route get 8.8.8.8", intern = TRUE)

tweet(paste(prefix, ip))