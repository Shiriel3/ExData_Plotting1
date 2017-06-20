# Read in data
t <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep=";")

# Perform date operations
t$Date <- as.Date(t$Date, "%d/%m/%Y")
d <- t[which(t$Date == "2007-02-01" | t$Date == "2007-02-02"),]
d$DateTime <- paste(d$Date, d$Time, sep=" ")
d$DateTime <- strptime(d$DateTime, "%Y-%m-%d %H:%M:%S")

# Plot
with(d, plot(DateTime,Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l"))

# Write to png
dev.copy(png, file="plot2.png")

# Close device
dev.off()
