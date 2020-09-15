#Reading the full data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Subsetting the Data
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#Converting the date class to date
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Combining the date and time columns
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

#Plot 3
with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

#Annotating the legend to the plot
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copying the plot to png
dev.copy(png, file="plot3.png", height=480, width=480)

#Turning off the png device
dev.off()