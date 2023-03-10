try( setwd(dirname(rstudioapi::getActiveDocumentContext()$path)))


ret <- c(1.1,1.5,1.25)
t12 <- c(1,0,1)
t23 <- c(0,1,1)

dat <- as.data.frame( rbind(
  c(-1,1,0),
  c(0,-1,1),
  c(-1,	0,1)
))

colnames(dat) <- c('d1','d2','d3')
dat$ret <- ret
summary( lm(ret~d2+d3-1, data=dat))

exp( lm(log(ret)~d2+d3-1, data=dat[1:2,])$coefficients)

exp( lm(log(ret)~d2+d3-1, data=dat)$coefficients)

index <- cbind(c(100,110,165), c(100,100,137))

svg('indices.svg', width=7, height=3)
par(mar=c(2,2,1,0))
plot(range(2021:2023),range(index), type='n', xlab='Year', ylab='Index')
lines(2021:2023, index[,1], lwd=3, col='lightblue')
lines(2021:2023, index[,2], lwd=3, col='red')
dev.off()
