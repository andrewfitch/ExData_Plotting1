#Reset all device settings
dev.off()

#Read in data
file <- "../../household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, sep=";", na.strings="?")

#Filter data
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#Open png device, generate historgram in it, and close the file
png("plot1.png", width=480, height=480)
hist(as.numeric(hpc$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

