#script to create plot4.png
#read in data
data <- read.table ("household_power_consumption.txt",header=TRUE,sep=";", colClasses=c("character","character",rep("numeric",7)),na.strings="?")
data$DateTime = paste (data$Date,data$Time)
data$DateTime = strptime (data$DateTime, "%d/%m/%Y %H:%M:%S")
data1 <- data[data$DateTime >= "2007-02-01 00:00:00" & data$DateTime <= "2007-02-02 23:59;59" & !is.na(data$DateTime),]


# create graphic device

png ("plot4.png",height=480,width=480)



# set up palette - 2 rows by 2 columns
par (mfrow = c(2,2))

# first plot in first row, first column
with (data1,plot (DateTime,Global_active_power,type="n",ylab="Global Active Power",xlab=""))
with (data1, lines (DateTime,Global_active_power))

# second plot in first row, second column
with (data1,plot (DateTime,Voltage,type="n",ylab="Voltage",xlab="datetime"))
with (data1, lines (DateTime, Voltage))

# third plot in second row, first column
with (data1, plot (DateTime, Sub_metering_1, type="n",ylab = "Energy sub metering",xlab=""))
with (data1, lines (DateTime,Sub_metering_1))
with (data1, lines (DateTime,Sub_metering_2, col="red"))
with (data1, lines (DateTime,Sub_metering_3, col="blue"))

legend ("topright",col=c("black","red","blue"),legend = c("Sub_metering 1","Sub_metering 2","Sub_metering 3"),lty=c(1,1,1), bty="n")

# fourth plot, in second row, second column
with (data1,plot (DateTime,Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime"))
with (data1, lines (DateTime,Global_reactive_power))

# turn off device
dev.off()
