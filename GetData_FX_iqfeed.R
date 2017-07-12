#Tenfore data ticker for EURUSD is EURUSD.ABBA
#https://quanttools.bitbucket.io/_site/get_started.html#get_market_data
#https://www.quantstart.com/articles/Downloading-Historical-Intraday-US-Equities-From-DTN-IQFeed-with-Python

#This gives daily data
#TODO : Get Intaday or Get Tick and convert to intraday, EST and London

library(QuantTools)

QuantTools_settings( settings = list(
  iqfeed_host = 'localhost',
  iqfeed_port = '9100'
) )

from = '2016-01-01'
to   = '2016-06-01'
symbol = 'EURUSD.ABBA'

get_iqfeed_data( symbol, from, to )
