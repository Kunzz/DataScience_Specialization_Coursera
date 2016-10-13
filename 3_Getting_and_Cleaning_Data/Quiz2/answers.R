Getting and Cleaning Data Quiez 2
# question 1.
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github", "1075906c187ca8af8a0f", "5ede8bb953e72b21d5abd49338720b55d7eb7499
")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))

## question 2 and 3 
acs  <- read.csv("getdata_data_ss06pid.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")
x1  <- unique(acs$AGEP)
x2  <- sqldf("select distinct AGEP from acs")
str(x1)
str(x2)
head(x2)
head(x1)

## question 4
library(XML)
con= url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
#htmlCode
sapply(htmlCode[c(10, 20, 30, 100)], nchar)

## question 5
file_name <- "getdata-wksst8110.for"
data  <- read.fwf(file_name, c(10, 9, 6, 7, 4, 9, 4, 9, 4), skip=4)
sum(data[,4])
