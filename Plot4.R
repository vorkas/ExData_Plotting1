data<-read.table("./ExploratoryDataAnalysis/household_power_consumption.txt",header=TRUE,sep=";")
library(dplyr)
pwr_cons<-tbl_df(data)
pwr_cons<-mutate(pwr_cons,Date=as.Date(Date),Time=strptime(Time))
two_day_period<-filter(pwr_cons,Date=="1/2/2007" | Date=="2/2/2007")

png("./ExploratoryDataAnalysis/Project1/Plot4.png")
par(mfrow=c(2,2),mar=c(4,4.1,4.1,2.1))

plot(as.numeric(as.character(two_day_period$Global_active_power)),pch=20,type="l",
     ylab="Global active power",xlab="",lwd=2,axes=FALSE)
axis(2,at=c(0,2,4,6),label=c(0,2,4,6))
axis(1,at=c(0,1450,2850),label=c("Thu","Fri","Sat"))
box(which="plot",lwd=2)

plot(as.numeric(as.character(two_day_period$Voltage)),type="n",xlab="datetime",ylab="Voltage",axes=FALSE)
points(as.numeric(as.character(two_day_period$Voltage)),type="l",lwd=2)
axis(2,at=c(234,238,242,246),label=c(234,238,242,246))
axis(1,at=c(0,1450,2900),label=c("Thu","Fri","Sat"))
box(which="plot",lwd=2)

plot(as.numeric(as.character(two_day_period$Sub_metering_1)),pch=20,type="n",
     ylab="Energy sub metering",xlab="",lwd=2,axes=FALSE)
points(as.numeric(as.character(two_day_period$Sub_metering_1)),type="l",col="black")
points(as.numeric(as.character(two_day_period$Sub_metering_2)),type="l",col="red")
points(as.numeric(as.character(two_day_period$Sub_metering_3)),type="l",col="blue")
axis(2,at=c(0,10,20,30),label=c(0,10,20,30))
axis(1,at=c(0,1450,2900),label=c("Thu","Fri","Sat"))
box(which="plot",lwd=2)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-",lwd=2,bty="n",col=c("black","red","blue"))

plot(as.numeric(as.character(two_day_period$Global_reactive_power)),type="n",xlab="datetime",ylab="Global_reactive_power",axes=FALSE)
points(as.numeric(as.character(two_day_period$Global_reactive_power)),type="l",lwd=1)
axis(2,at=c(0,0.1,0.2,0.3,0.4,0.5),label=c(0,0.1,0.2,0.3,0.4,0.5))
axis(1,at=c(0,1450,2900),label=c("Thu","Fri","Sat"))
box(which="plot",lwd=2)
dev.off()