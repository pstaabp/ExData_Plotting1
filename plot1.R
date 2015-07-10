data<-read.table("../household_power_consumption.txt",
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 sep=";",na.strings="?",skip=66637,nrows=2880,
                 colClasses = c(NA,NA,"numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
par(mfrow=c(1,1))
par(mar=c(5,5,2,2))
hist(data$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (in kilowatts)")
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file 
dev.off() ## Don't forget to close the PNG device!