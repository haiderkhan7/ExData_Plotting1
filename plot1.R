
#Reading the full data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Subsetting the Data
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#Converting the date class to date
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Plotting the Histogram
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Copying the plot to png device
png("plot1.png", width=480, height=480)

#Turning off the png device
dev.off()