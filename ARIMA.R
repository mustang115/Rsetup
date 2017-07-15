# Time Series Analysis and its Applications #Robert Shumway #David Stoffer
#astsa


library(astsa)

#JJ quarterly earnings
data(jj)
plot(jj, main="J&J Quarterly Earnings per share", type="c")
text(jj, labels=1:4, col=1:4)
