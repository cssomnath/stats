#!/usr/bin/Rscript
#
# author: somnath.banerjee
# date  : March  7, 2015
require(scales)

df <- read.delim('~/public_github/stats/data/conv_by_imp_freq.tsv')
df$conv_rate <- df$buyers / df$customers
sd <- sqrt(df$conv_rate * (1 - df$conv_rate) / df$customers)
z <- qnorm(0.975)
df$lb <- df$conv_rate - z * sd
df$up <- df$conv_rate + z * sd

df <- df[df$index<=30, ]
plot(conv_rate ~ index, data=df, type='l', ylim=range(c(df$lb, df$up)),
     col='blue', xlab="impression count", ylab="conversion rate")
polygon(c(df$index, rev(df$index)),c(df$lb, rev(df$up)),
        col=alpha("grey30",0.3), border = NA)
lines(lb ~ index, data=df, type='l', lty=2)
lines(up ~ index, data=df, type='l', lty=2)

fit <- lm(conv_rate ~ index + I(index^2), data=df, weights=customers)
lines(df$index, predict(fit, df), col='red')
