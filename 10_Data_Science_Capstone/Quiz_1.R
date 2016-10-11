
## Question 1
fileSize <- file.info("/Users/KunZhu/Dropbox/Coursera/final/en_US/en_US.blogs.txt")$size / 1024^2
fileSize

##Question 2

blogs <- readLines("/Users/KunZhu/Dropbox/Coursera/final/en_US/en_US.blogs.txt")
news <- readLines("/Users/KunZhu/Dropbox/Coursera/final/en_US/en_US.news.txt")
twitter <- readLines("/Users/KunZhu/Dropbox/Coursera/final/en_US/en_US.twitter.txt")
length(twitter)