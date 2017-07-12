library(quantmod)
getSymbols.google("AMZN", from="2007-01-01", to=Sys.Date, env = .GlobalEnv)
getSymbols.google("AMZN", from="2007-01-01", to=Sys.Date(), env = .GlobalEnv)
dataxts <- merge(SPY$Close, AMZN$Close)
dataxts <- merge(SPY$SPY.Close, AMZN$AMZN.Close)
colnames(dataxts) <- c("SPY","AMZN")
model=lm(AMZN~SPY, data=dataxts)
summary(model)