# Read in data
t <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep=";")

# Perform Date operations
t$Date <- as.Date(t$Date, "%d/%m/%Y")
d <- t[which(t$Date == "2007-02-01" | t$Date == "2007-02-02"),]

# Make histogram
with(d, hist(Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))

# Write to png
dev.copy(png, file="plot1.png")

# Close device
dev.off()
