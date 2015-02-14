#!/usr/bin/Rscript
#
# author: somnath.banerjee
# date  : February 13, 2015
n1 <- 530
c1 <- 1
n2 <- 5345
c2 <- 51

p1 <- c1/n1
p2 <- c2/n2

s1 <- p1 * (1 - p1) / n1
s2 <- p2 * (1 - p2) / n2

mu <- p2 - p1
se <- sqrt(s1 + s2)

p.value <- pnorm(mu/se, lower.tail=FALSE)
print(p.value)
