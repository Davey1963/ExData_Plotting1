full.data <- read.table("C:/Users/pbagavan/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
full.data$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(data)
data$Global_active_power <- as.numeric(required.data$Global_active_power)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", ylim = c(0,1200))

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()