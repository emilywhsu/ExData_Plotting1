loading<-read.table("/Users/emilyhsu/CourseEra/household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
loading$DateTime=paste(loading$Date, loading$Time)
loading$DateTime=as.POSIXlt(loading$DateTime,format="%d/%m/%Y %H:%M:%S")
loading$Date=NULL
loading$Time=NULL
subloading<-subset(loading,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))
png(filename="plot1.png")
hist(subloading$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
