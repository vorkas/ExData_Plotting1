data<-read.table("./ExploratoryDataAnalysis/household_power_consumption.txt",header=TRUE,sep=";")
library(dplyr)
pwr_cons<-tbl_df(data)
pwr_cons<-mutate(pwr_cons,Date=as.Date(Date),Time=strptime(Time))
two_day_period<-filter(pwr_cons,Date=="1/2/2007" | Date=="2/2/2007")
hist(as.numeric(as.character(two_day_period$Global_active_power)),main="Global active power",xlab="Global active power (kilowatts)",col="red")
dev.copy(png,file="./ExploratoryDataAnalysis/Project1/Plot1.png")
dev.off()