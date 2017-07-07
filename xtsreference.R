#xts functions reference

# data.table last function interefering with xts last, use the below to fix
xts::last(data,10)


# returns the index based on rownumber refrence
time(data[10])
