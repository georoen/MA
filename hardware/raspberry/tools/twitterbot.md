### sendEmail
**DEPRECATED** Sourcecode from: http://www.gtkdb.de/index_36_2296.html did not work as expected. Error *STARTTLS failed* when running from cron or sudo.  

### TwitterBot
The 21st century is the age of IoT. Here I use a twitter bot to get updated about the raspberrys status.  

![**.gitignore**](../../../Twitterbot.jpg)

#### Preperation
First a new [Twitter-Account](https://support.twitter.com/articles/334631#) was created. It is protected so just accepeted followers can read its tweets.  
To access the account via `twitteR` four API-Keys have to be generated. These are stored in `dsf`. Read developer details in [official documentation](https://apps.twitter.com/).  
Copy `/hardware/raspberry/tools/twitter_tweet-ip.R` to RasPi.  
Using R-Package `twitteR`. Install two depending linux packages `sudo apt install ilbssl-dev libcurl4-openssl-dev `. Then open `R` and `install.packages("twitteR")`.  

#### Crontab
To stay in touch with the RasPi it can tweet.  
Manage [CRON](https://wiki.ubuntuusers.de/Cron/) schedule with `crontab -e`. I started with tweeting its IP. Here every time it boots and at 00:00.  
`@reboot Rscript ~/tools/twitter_tweet-ip.R`  
`* * * * * Rscript ~/tools/twitter_tweet-ip.R`  

#### Troubleshoot
Returns error 403: Tweets can not be equal.