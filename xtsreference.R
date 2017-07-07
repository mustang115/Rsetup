#xts functions reference

# data.table last function interefering with xts last, use the below to fix, otherwise get a dimensionality error
xts::last(data,10)


# returns the index based on rownumber refrence
time(data[10])


# find the first non NA index based on a particular row
# use is.na with which and min 

dateStart <- time(rolling.model[min(which(!is.na(rolling.model$fit))),])

# subsetting xts by parameters holding dates 
# you cant just use variable names as subsets, use the paste command to create the deried output
# https://stackoverflow.com/questions/14101694/subsetting-in-xts-using-a-parameter-holding-dates

strategy.returns <- strategy.returns[paste(dateStart,dateEnd,sep="/")]

