#https://github.com/IFFranciscoME/ROandaAPI


Pkg <- c("base","downloader","forecast","httr","jsonlite","lubridate","moments",
"PerformanceAnalytics","quantmod","reshape2","RCurl","stats","scales","tseries",
"TTR","TSA","xts","zoo")

inst <- Pkg %in% installed.packages()
if(length(Pkg[!inst]) > 0) install.packages(Pkg[!inst])
instpackages <- lapply(Pkg, library, character.only=TRUE)



