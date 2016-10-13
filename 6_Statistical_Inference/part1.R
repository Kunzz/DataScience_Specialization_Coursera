library(ggplot2)

# n1 is the number of averages of the samples from the studied exponential distribution.
# n is number of exponentially distributed samples used to calculate averages.
# lambda is the expotential distribution rate
n  <- 1000
n1  <- 40
lambda  <- 0.2

# Calulcate the theoritical mean and standard deviation of the exponential distribution.
theo_mean  <- 1/lambda
theo_sd <- 1/lambda

# Create a new distribution including n number of exponential distribution mean.
mns = NULL
for (i in 1 : n) mns = c(mns, mean(rexp(n1, lambda)))

# Calulcate the mean and standard deviation of the averages of the samples from the exponential distribution. 
# These values are referred to as sampled mean and standard deviation.
smp_mean  <- mean(mns)
smp_sd <- sd(mns)

# Calulcate the difference between the theoritical and sampled mean and standard deviation.
delta_mean <- sqrt((smp_mean -theo_mean)^2)
delta_sd  <- sqrt((smp_sd -theo_sd/sqrt(n1))^2)

# Plot the histogram and boxplot of the sampled averages.
# together with a normal distribution with mean= 1/lambda and standard deviation = 1/lambda.
nf <- layout(mat = matrix(c(1,2),2,1, byrow=TRUE),  height = c(1,3))
par(mar=c(3.1, 3.1, 1.1, 2.1))
boxplot(mns, horizontal=TRUE,  outline=TRUE,ylim=c(min(mns),max(mns)), frame=F, col = "lightgreen")
g  <- hist(mns, xlim=c(min(mns),max(mns)), xlab="Frequency", main="", col="pink")
xfit<-seq(min(mns),max(mns),length=40)
yfit<-dnorm(xfit,mean=smp_mean,sd=smp_sd)
yfit <- yfit*diff(g$mids[1:2])*length(mns)
lines(xfit, yfit, col="black", lwd=2) 
