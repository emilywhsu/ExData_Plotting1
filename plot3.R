loading<-read.table("/Users/emilyhsu/CourseEra/household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
loading$DateTime=paste(loading$Date, loading$Time)
loading$DateTime=as.POSIXlt(loading$DateTime,format="%d/%m/%Y %H:%M:%S")
loading$Date=NULL
loading$Time=NULL
subloading<-subset(loading,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))
png(filename="plot3.png")
plot(x=(subloading$DateTime),y=subloading$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(x=(subloading$DateTime),y=subloading$Sub_metering_2,col="red")
lines(x=(subloading$DateTime),y=subloading$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2)
dev.off()
