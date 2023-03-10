try( setwd(dirname(rstudioapi::getActiveDocumentContext()$path)))

swap <- c(0,140, 140, 140, 140)
index <- c(0, 0, -100, 300, 500)
short <- swap - index
long <- index -swap

data <- t(as.matrix(cbind(long, short)))
colnames(data) <- c('0','Q1','Q2','Q3','Q4')

svg('barchart-swap.svg', width=7, height=3)
par(mar=c(2,2,1,0))
bp = barplot(data[1,], col='lightblue', 
        space=2,
        border=NA,
        ylab='bps', ylim=c(-400, 400))
legend('topleft', legend=c('short','long'), fill=c('red','lightblue'), bty='n', border=NA, cex=1)

barplot(data[2,], col='red', 
        space=2,
        border=NA,
        ylab='bps', ylim=c(-400, 400), add=TRUE, axes=FALSE)
abline(h=0, lwd=2, lty=3)
box()

text(bp[1], 0, 0, cex=1)
for(i in 2:length(bp)){
  label.y <- abs(short)-30
  text(bp[i], label.y[i], abs(short[i]), cex=1)
  text(bp[i], -label.y[i], -abs(long[i]), cex=1)
}
dev.off()