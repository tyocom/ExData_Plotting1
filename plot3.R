# script to create plot3.png
#read in data
data <- read.table ("household_power_consumption.txt",header=TRUE,sep=";", colClasses=c("character","character",rep("numeric",7)),na.strings="?")
data$DateTime = paste (data$Date,data$Time)
data$DateTime = strptime (data$DateTime, "%d/%m/%Y %H:%M:%S")
data1 <- data[data$DateTime >= "2007-02-01 00:00:00" & data$DateTime <= "2007-02-02 23:59;59" & !is.na(data$DateTime),]

#create graphics device
png ("plot3.png", height=480, width=480)

with (data1, plot (DateTime, Sub_metering_1, type="n",ylab = "Energy sub metering"))
with (data1, lines (DateTime,Sub_metering_1))
with (data1, lines (DateTime,Sub_metering_2, col="red"))
with (data1, lines (DateTime,Sub_metering_3, col="blue"))

legend ("topright",col=c("black","red","blue"),legend = c("Sub_metering 1","Sub_metering 2","Sub_metering 3"),lty=c(1,1,1))

#turn off device
dev.off()



