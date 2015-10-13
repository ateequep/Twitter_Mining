# load the required libraries
if (!require("ROAuth")) install.packages("ROAuth")
if (!require("twitteR")) install.packages("twitteR")
if (!require("data.table")) install.packages("data.table")
if (!require("dplyr")) install.packages("dplyr")

consumer_key <- "SwEvEK60CvWLebMRM8kkYOiq1"
consumer_secret <- "LeCGhJWr0PgVg0m85hkOQItYyX4WXq7sOitqA51XD49GLoxZIN"
access_token <- "1493236998-xkUDiTrxWazuAFieX7Iim4MbixMr2qZcVfCD0jE"
access_secret <- "RevU3CKKcDHtebH5G99K2PXTRBNd9qlr8c1Pdk"


setup_twitter_oauth(consumer_key = consumer_key,
                    consumer_secret = consumer_secret, 
                    access_token = access_token,
                    access_secret = access_secret)

rawTweets <- searchTwitter("#Citi", n=15000, since = Sys.Date())

tweets <- data.table(twListToDF(tweetsCiti))



rate.limit <- getCurRateLimitInfo()

## If return 350, Authenticated session = more API calls allowed / hour
rate.limit$hourlyLimit
rate.limit$remainingHits
rate.limit$resetTime
