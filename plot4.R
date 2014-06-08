png("plot4.png")
par(mfcol = c(2,2))
rawfile <- file("household_power_consumption.txt","r")
cat(grep("(^Date)|(^[1|2]/2/2007)", readLines(rawfile), value = TRUE), sep="\n", file="filtered.txt")
close(rawfile)
powerdata <- read.csv2("filtered.txt", na.strings = "?")
datetime <- strptime(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(as.character(powerdata$Global_active_power))
plot(datetime, gap, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)")

plot(datetime, as.numeric(as.character(powerdata$Sub_metering_1)), type = 'l',xlab ='', ylab="Energy sub metering")
lines(datetime, as.numeric(as.character(powerdata$Sub_metering_2)), type = 'l', col = "red")
lines(datetime, as.numeric(as.character(powerdata$Sub_metering_3)), type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"),lty=c(1,1,1),pt.cex = cex,cex=1)

plot(datetime, as.numeric(as.character(powerdata$Voltage)),type = 'l', ylab = "Voltage")

plot(datetime, as.numeric(as.character(powerdata$Global_reactive_power)),type = 'l', ylab = "Global_reactive_power")

dev.off()