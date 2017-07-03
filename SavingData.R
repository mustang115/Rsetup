# convert as data frame

pdata <- as.data.frame(pxts)

#Add rownames as first column so that the date header is preserved
pdata <- cbind(Date=rownames(pdata),pdata)

# Write without the rownames, so that while reading we can just take in the using fread without headaches and convert to xts and also
# be able to open it in excel to look at the data in a clear way

write.table(pdata,file = paste0(file.path,"/",file.name), sep=",",row.names=FALSE, na="")
