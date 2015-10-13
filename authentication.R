## Twitter Listener - Streaming tweets real time based on list of keywords provided
## Author - Ateeque Patel

## Creating the authetication object to authorize twitter pull 
## Please dont share uses Ateeque's developer account!!!

consumer_key <- ""
consumer_secret <- ""
access_token <- ""
access_secret <- ""

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
