
## load the required libraries
if (!require("ROAuth")) install.packages("ROAuth")
if (!require("streamR")) install.packages("streamR")
if (!require("data.table")) install.packages("data.table")
if (!require("dplyr")) install.packages("dplyr")

## helper function for generating file names
createHourlyFile <- function() {
        ## create the file name based on the system date and hour
         fileName <- paste0("tweeterStream_", format(Sys.time(), "%Y%m%d%H%M"))
}

## autheticate the pull
ifelse(file.exists("./my_oauth.Rdata"),load("my_oauth.Rdata"),source("./authentication.R"))

## load the keyword list for tracking
keywordList <- fread(input = "./Keywords.csv",sep = ",",header = T)[[1]]
x <- 0
while (x<3){
fileName <-  createHourlyFile()    
filterStream(file.name= paste0(fileName,".json") , track= keywordList, timeout=60, oauth=my_oauth,language = "en")
parsedTweets <- parseTweets(paste0(fileName,".json"))
write.csv(parsedTweets,paste0(fileName,".csv"),row.names=F)
x<-x+1
}

#limit <- getCurRateLimitInfo()[61,3]        
#Sys.sleep(900)
#limit <- getCurRateLimitInfo()[61,3]
#class(c("citi","citibank","twitter","google","song","movie"))
#rate.limit <- getCurRateLimitInfo()
#rate.limit$hourlyLimit
#rate.limit$remainingHits
#rate.limit$resetTime


