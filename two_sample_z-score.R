#!/usr/bin/Rscript
#
# author: somnath.banerjee
# date  : February 13, 2015
n1 <- 273929
c1 <- 7489
n2 <- 3956
c2 <- 84

p1 <- c1/n1
p2 <- c2/n2

s1 <- p1 * (1 - p1) / n1
s2 <- p2 * (1 - p2) / n2

mu <- abs(p1 - p2)
se <- sqrt(s1 + s2)

p.value <- 2 * pnorm(mu/se, lower.tail=FALSE)
print(p.value)
