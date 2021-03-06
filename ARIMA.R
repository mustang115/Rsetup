# Time Series Analysis and its Applications #Robert Shumway #David Stoffer
#astsa


#TODO
# understand different type of type="" plots in base R graphics package

library(astsa)

#  series  I
#JJ quarterly earnings
data(jj)
plot(jj, main="J&J Quarterly Earnings per share", type="c")
text(jj, labels=1:4, col=1:4)


#common features of time series data
# 1. upward trend
# 2. seasonality (1,4 up, 2,4, down)
# 3. heteroskedasticity   variance prop level 


# series II ( Global temperature differences)
plot(globtemp, main="Global Termperature Deviations", type="o")

# 1. No Trend
# 2. No seasonal component
# 3. Homoskedasticity ( variance constant event with level)


# series III (S&P 500 Weekly returns)

library(xts)
plot(sp500w, main="S&P 500 weekly returns")

# 1. No Trend
# 2. No seasonality
# 3. Homoskedastic
# 4. Example of Noise process


# To Remove

# 1. Trend - detrend ( diff) 
#       Works for 1) trend stationary processes and 2) random walk with drift
# 2. Seasonality
# 3. Heteroskedasticity - take a log diff( you are essentially calculating the return or growth rate of the series)


## For trend stationarity


par(mfrow=c(2,1))
plot(globtemp)
plot(diff(globtemp)) 
par(mfrow=c(1,1))   #Revert plot back to normal


ppar(mfrow=c(2,1))
plot(cmort)
plot(diff(cmort)) 
par(mfrow=c(1,1))   #Revert plot back to normal


## For trend and heteroskedasticity

# astsa and xts are preloaded 

# Plot GNP series (gnp) and its growth rate
par(mfrow = c(2,1))
plot(gnp)
plot(diff(log(gnp)))

# Plot DJIA closings (djia$Close) and its returns
par(mfrow = c(2,1))
plot(djia$Close)
plot(diff(log(djia$Close)))

##  any stationary time series can be written as a linear combination of white noise. In addition, any ARMA model has this form, so it is a good choice for modeling stationary time series.
## Simulating AR and MA models with arima.sim()

# Generate and plot white noise
WN <- arima.sim( model= list(c(0,0,0)) , 200 )
plot(WN)


# Generate and plot an MA(1) with parameter .9 
MA <- arima.sim( model = list (c(0,0,1), ma=0.9), 200)
plot(MA)

# Generate and plot an AR(2) with parameters 1.5 and -.75
AR <- arima.sim( model = list( c(2,0,0), ar=c(1.5, -0.75)), 200)
plot(AR)

 

