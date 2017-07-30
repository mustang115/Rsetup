library(quantmod)

#getSymbols automatically loads the variable in the environment! DISABLE autoassign!
getSymbols.google(Symbols="SPY", from="2007-01-01", to=Sys.Date(), env = .GlobalEnv)
getSymbols.google("AMZN", from="2007-01-01", to=Sys.Date(), env = .GlobalEnv)

#This assigns the data to aa, use this!
aa <- getSymbols("SPY",from=Sys.Date()-10, to =Sys.Date(),auto.assign = FALSE,src = "google")

dataxts <- merge(SPY$Close, AMZN$Close)
dataxts <- merge(SPY$SPY.Close, AMZN$AMZN.Close)
colnames(dataxts) <- c("SPY","AMZN")
model=lm(AMZN~SPY, data=dataxts)
summary(model)
