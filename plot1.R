## Read raw data
data <- read.table("household_power_consumption.txt",sep=";",header=T)

## Subset by the date of 2007/2/1 and 2007/2/2
data2 <- subset(data,{as.Date(data$Date,format="%d/%m/%Y") == "2007-02-01" | as.Date(data$Date,format="%d/%m/%Y") == "2007-02-02"} )

## PLot Histogram
hist(as.numeric(as.character(data2$Global_active_power)),main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

## Copy plot to png file
dev.copy(png,file="plot1.png")
dev.off()
