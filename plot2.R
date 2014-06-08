png("plot2.png")
rawfile <- file("household_power_consumption.txt","r")
cat(grep("(^Date)|(^[1|2]/2/2007)", readLines(rawfile), value = TRUE), sep="\n", file="filtered.txt")
close(rawfile)
powerdata <- read.csv2("filtered.txt", na.strings = "?")
datetime <- strptime(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(as.character(powerdata$Global_active_power))
plot(datetime, gap, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)")
dev.off()



