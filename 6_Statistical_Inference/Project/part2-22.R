library(ggplot2)

# ToothGrowth summary
summary(ToothGrowth)

# t-test for len and supp  
t.test(len ~ supp, data = ToothGrowth)
# boxplot for len and supp 
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(aes(x=supp, y=len), data=ToothGrowth) + geom_boxplot(aes(fill=supp))

# Reorgnize the data into three groups according to their dose levels
# The first group is 0.5 and 1, the second group is 0.5 and 2
# and the third group is 1 and 2.
x1 <- ToothGrowth[ToothGrowth$dose==0.5,1]
x2 <- ToothGrowth[ToothGrowth$dose==1,1]
x3 <- ToothGrowth[ToothGrowth$dose==2,1]
x_g1  <- cbind(x1,x2)
x_g2  <- cbind(x1,x3)
x_g3  <- cbind(x2,x3)

# t-test for len and three dose groups
t.test(x_g1[,1],x_g1[,2], paired=FALSE, var.equal=FALSE)
t.test(x_g2[,1],x_g2[,2], paired=FALSE, var.equal=FALSE)
t.test(x_g3[,1],x_g3[,2], paired=FALSE, var.equal=FALSE)

# boxplot for len and dose levels
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(aes(x=dose, y=len), data=ToothGrowth) + geom_boxplot(aes(fill=dose))
