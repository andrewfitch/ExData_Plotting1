#Reset all device settings
dev.off()

#Read in data
file <- "../../household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

#Filter data
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#Create datetime column
hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time),  "%d/%m/%Y %H:%M:%S") 

#Make columns numeric
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Sub_metering_1  <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2  <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3  <- as.numeric(hpc$Sub_metering_3)

#Open png device, generate graph, and close the file
png("plot4.png", width=480, height=480)

#set up for four graphs
par(mfcol = c(2, 2))
#graph 1
with(hpc, plot(Datetime, Global_active_power, type="l", xlab="",  ylab="Global Active Power (kilowatts)"))
#graph 2
with(hpc, plot(Datetime, Sub_metering_1, type="l", col="black", xlab="",  ylab="Energy sub metering"))
with(hpc, lines(Datetime, Sub_metering_2, type="l", col="red"))
with(hpc, lines(Datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1, bty="n")
#graph 3
with(hpc, plot(Datetime, Voltage, type="l", xlab="datetime",  ylab="Voltage"))
#graph 4
with(hpc, plot(Datetime, Global_reactive_power, type="l", xlab="datetime",  ylab="Global_reactive_power"))
dev.off()
