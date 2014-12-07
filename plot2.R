# script to create plot2.png
# read in data
data <- read.table ("household_power_consumption.txt",header=TRUE,sep=";", colClasses=c("character","character",rep("numeric",7)),na.strings="?")
data$DateTime = paste (data$Date,data$Time)
data$DateTime = strptime (data$DateTime, "%d/%m/%Y %H:%M:%S")
data1 <- data[data$DateTime >= "2007-02-01 00:00:00" & data$DateTime <= "2007-02-02 23:59;59" & !is.na(data$DateTime),]

# create graphic device

png ("plot2.png",height=480,width=480)

#create plot
with (data1,plot (DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=""))
with (data1, lines (DateTime,Global_active_power))

#turn device off
dev.off()
