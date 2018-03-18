#Reset all device settings
dev.off()

#Read in data
file <- "../../household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

#Filter data
hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#Create datetime column
hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time),  "%d/%m/%Y %H:%M:%S") 

#Make GAP column numeric
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

#Open png device, generate graph, and close the file
png("plot2.png", width=480, height=480)
with(hpc, plot(Datetime, Global_active_power, type="l", xlab="",  ylab="Global Active Power (kilowatts)"))
dev.off()
