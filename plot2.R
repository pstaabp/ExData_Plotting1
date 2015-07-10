data<-read.table("../household_power_consumption.txt",
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 sep=";",na.strings="?",skip=66637,nrows=2880,
                 colClasses = c(NA,NA,"numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$dt<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
firstDT<-data$dt[1]
data$timediff = as.numeric(difftime(data$dt,firstDT),units="days")

par(mfrow=c(1,1))
par(mar=c(5,5,2,2))

plot(data$timediff,data$Global_active_power,type='l',ylab="Global Active Power (in kilowatts)",xaxt="n",xlab="")
axis(1,0:2,c("Thu","Fri","Sat"))


dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file 
dev.off() ## Don't forget to close the PNG device!