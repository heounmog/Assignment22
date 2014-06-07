## Read raw data
data <- read.table("household_power_consumption.txt",sep=";",header=T)

## Subset by the date of 2007/2/1 and 2007/2/2
data2 <- subset(data,{data$Date == "1/2/2007" | data$Date == "2/2/2007"} )

## Make Time variable as x-axis
x <- strptime(paste(data2$Date, data2$Time),"%d/%m/%Y %H:%M:%S")

## plot the graph
par(mfrow=c(2,2))
with(data2, {
  ## top-left one : Global Active Power
  plot(x,as.numeric(as.character(Global_active_power)), xlab="", ylab = "Global Active Power (kilowatts)", type="l")
  
  ## top-right one : Voltage    
  plot(x,as.numeric(as.character(Voltage)), xlab="datetime", ylab = "Voltage", type="l")
  
  ## bottom-left one : energy submetering  
  plot(x,as.numeric(as.character(Sub_metering_1)), xlab="", ylab = "Energy sub metering", type="n")
  lines(x,as.numeric(as.character(Sub_metering_1)),col="black")
  lines(x,as.numeric(as.character(Sub_metering_2)),col="red")
  lines(x,as.numeric(as.character(Sub_metering_3)),col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8)
    
  ## bottom-right one : global reactive power 
  plot(x,as.numeric(as.character(Global_reactive_power)), xlab="datetime", ylab = "Global_reactive_power", type="l")
})  

## Copy plot to png file
dev.copy(png,file="plot4.png")
dev.off()
