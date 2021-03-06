data<-read.table("./ExploratoryDataAnalysis/household_power_consumption.txt",header=TRUE,sep=";")
library(dplyr)
pwr_cons<-tbl_df(data)
pwr_cons<-mutate(pwr_cons,Date=as.Date(Date),Time=strptime(Time))
two_day_period<-filter(pwr_cons,Date=="1/2/2007" | Date=="2/2/2007")
png("./ExploratoryDataAnalysis/Project1/Plot3.png")
plot(as.numeric(as.character(two_day_period$Sub_metering_1)),pch=20,type="n",
     ylab="Energy sub metering",xlab="",lwd=2,axes=FALSE)
points(as.numeric(as.character(two_day_period$Sub_metering_1)),type="l",col="black")
points(as.numeric(as.character(two_day_period$Sub_metering_2)),type="l",col="red")
points(as.numeric(as.character(two_day_period$Sub_metering_3)),type="l",col="blue")
axis(2,at=c(0,10,20,30),label=c(0,10,20,30))
axis(1,at=c(0,1450,2900),label=c("Thu","Fri","Sat"))
box(which="plot",lwd=2)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-",lwd=2,col=c("black","red","blue"))
dev.off()