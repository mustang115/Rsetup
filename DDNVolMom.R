#https://quantstrattrader.wordpress.com/2015/02/26/the-downside-of-rankings-based-strategies/
#https://stackoverflow.com/questions/1743698/evaluate-expression-given-as-a-string
#https://quantstrattrader.wordpress.com/tag/r/
# Evaluate regular expression as string


library(quantmod)
library(PerformanceAnalytics)
library(TTR)

symbols <- c("XIV","VXX","VXZ","SHY")

prices <- list()


i=2   #loop diagnostice

for( i in 1:length(symbols))
{
  print(i)
  price <- getSymbols(Symbols = symbols[i],env=.GlobalEnv, src="google",auto.assign = FALSE)
  str <- paste0("price <- price$",symbols[i],".Close")
  eval(parse(text = str))
  colnames(price) <- symbols[i]
  prices[[i]] <-price 
  
}

prices <- na.omit(do.call(cbind,prices))
returns <- na.omit(Return.calculate(prices))

# compute momentums ( there is a momentum function in TTR as well)
# apply function doesnt return xts, so convert it, you wont have index otherwise

momentums <- na.omit(xts(apply(prices,MARGIN = 2, FUN=ROC, n=83), order.by=index(prices)))


# find highest asset and assign column names
topAsset <- function(row,assetNames)
{
  out <- row==max(row,na.rm=TRUE)
  names(out) <- assetNames
  out <- data.frame(out)
  return(out)
}


# find highest asset each day 



highestMom <- apply(momentums, MARGIN = 1, FUN=topAsset,colnames(momentums))
highestMom <- xts(t(do.call(cbind,highestMom)),order.by=index(momentums))


# observe today's close and buy tomorrow's close

buyTomorrow <- na.omit(xts(rowSums(returns*lag(highestMom,2)),order.by = index(highestMom)))


