d <- read.delim("data/conv_by_exchange.tsv")
d$exchange_name <- as.factor(d$exchange_name)
d$conv_rate <- d$buyers / d$viewers

e <- data.frame(aggregate(d$viewers, by=list(d$exchange_name), FUN=sum))
names(e) <- c('exchange_name', 'viewers')
e <- e[e$viewers >= 1000, ]
df <- subset(d, d$exchange_name %in% e$exchange_name)
df$exchange_name <- droplevels(df$exchange_name)
labels <- levels(df$exchange_name)

par(mar=c(10, 4, 1, 1))
boxplot(conv_rate ~ exchange_name, data=df, ylab="Conversion Rate", ylim=c(0, 0.01),
        xaxt='n', col='limegreen')
axis(1, at=seq_along(labels), labels=FALSE)
text(x =  seq_along(labels), y = par('usr')[3] - 0.0003, srt = 45, labels = labels, adj=1,
     xpd=TRUE, cex=1)
grid(lwd=2)
