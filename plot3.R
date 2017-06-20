# Read in data
t <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep=";")

# Perform date operations
t$Date <- as.Date(t$Date, "%d/%m/%Y")
d <- t[which(t$Date == "2007-02-01" | t$Date == "2007-02-02"),]
d$DateTime <- paste(d$Date, d$Time, sep=" ")
d$DateTime <- strptime(d$DateTime, "%Y-%m-%d %H:%M:%S")

# Begin plotting
with(d, plot(DateTime,Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black"))
with(d, points(DateTime,Sub_metering_2, type="l", col="red"))
with(d, points(DateTime,Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)

# Write to png
dev.copy(png, file="plot3.png")

# Close device
dev.off()
