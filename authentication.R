consumer_key <- "SwEvEK60CvWLebMRM8kkYOiq1"
consumer_secret <- "LeCGhJWr0PgVg0m85hkOQItYyX4WXq7sOitqA51XD49GLoxZIN"
access_token <- "1493236998-xkUDiTrxWazuAFieX7Iim4MbixMr2qZcVfCD0jE"
access_secret <- "RevU3CKKcDHtebH5G99K2PXTRBNd9qlr8c1Pdk"

requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

my_oauth <- OAuthFactory$new(consumerKey = consumer_key, consumerSecret = consumer_secret, 
                             oauthKey = access_token, oauthSecret = access_secret,
                             requestURL = requestURL, accessURL = accessURL, authURL = authURL)

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
my_oauth$handshake(cainfo="cacert.pem")
save(my_oauth, file = "my_oauth.Rdata")
