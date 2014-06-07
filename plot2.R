## Read raw data
data <- read.table("household_power_consumption.txt",sep=";",header=T)

## Subset by the date of 2007/2/1 and 2007/2/2
data2 <- subset(data,{data$Date == "1/2/2007" | data$Date == "2/2/2007"} )

## Make Time variable as x-axis
x <- strptime(paste(data2$Date, data2$Time),"%d/%m/%Y %H:%M:%S")

## plot the graph
plot(x,as.numeric(as.character(data2$Global_active_power)), xlab="", ylab = "Global Active Power (kilowatts)", type="l")

## Copy plot to png file
dev.copy(png,file="plot2.png")
dev.off()
