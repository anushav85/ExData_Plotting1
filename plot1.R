png("plot1.png")
rawfile <- file("household_power_consumption.txt","r")
cat(grep("(^Date)|(^[1|2]/2/2007)", readLines(rawfile), value = TRUE), sep="\n", file="filtered.txt")
close(rawfile)
powerdata <- read.csv2("filtered.txt", na.strings = "?")
datetime <- strptime(paste(powerdata$Date, powerdata$Time), format = "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(as.character(powerdata$Global_active_power))
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


