full.data <- read.table("C:/Users/pbagavan/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
full.data$Date <- as.Date(full.data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(full.data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full.data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()