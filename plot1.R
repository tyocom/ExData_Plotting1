# script to create plot 1
# read in data
data <- read.table ("household_power_consumption.txt",header=TRUE,sep=";", colClasses=c("character","character",rep("numeric",7)),na.strings="?")
data$DateTime = paste (data$Date,data$Time)
data$DateTime = strptime (data$DateTime, "%d/%m/%Y %H:%M:%S")
data1 <- data[data$DateTime >= "2007-02-01 00:00:00" & data$DateTime <= "2007-02-02 23:59;59" & !is.na(data$DateTime),]

#create graphic device
png (filename="plot1.png",width=480,height=480)

# create plot
hist(data1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#turn off device
dev.off()

