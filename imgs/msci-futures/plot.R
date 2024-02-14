try( setwd(dirname(rstudioapi::getActiveDocumentContext()$path)))
library(jsonlite)
library(tidyverse)

mar24 <- fromJSON('./json-mar-24.json') %>%
  as.data.frame %>% 
  mutate(date = as.Date(bars.1, format='%a %b %d 00:00:00 %Y'),
         mar24 = bars.2) %>% 
         select('date','mar24')

mar25 <- fromJSON('./json-mar-25.json') %>%
  as.data.frame %>% 
  mutate(date = as.Date(bars.1, format='%a %b %d 00:00:00 %Y'),
         mar25 = bars.2) %>% 
  select('date','mar25')


mar26 <- fromJSON('./json-mar-26.json') %>%
  as.data.frame %>% 
  mutate(date = as.Date(bars.1, format='%a %b %d 00:00:00 %Y'),
         mar26 = bars.2) %>% 
  select('date','mar26')

dat <- mar24 %>% 
  merge(mar25, all=TRUE ) %>% 
  merge(mar26, all=TRUE )


svg('futures.svg', width=9, height=4)
  plot(range(dat$date), range(dat$mar24, dat$mar25, dat$mar26, na.rm=TRUE), type='n',
     xlab='Date', ylab='Price')
  lines(dat$date, dat$mar24, col='black', lwd=1)
  lines(dat$date, dat$mar25, col='blue', lwd=1)
  lines(dat$date, dat$mar26, col='red', lwd=1)
  legend('topleft',c('Mar 24', 'Mar 25', 'Mar 26'), col=c('black','blue','red'), lwd=2, bty='n')
dev.off()