fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./Dataset.zip")
unzip(zipfile = "./Dataset.zip", exdir = "./")
hpc <- read.table("C:/Users/jackman/Desktop/R Files/Exploratory Data Analysis/Week 1/Electric Power Consumption Exercise/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc_subset <- subset(hpc, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
hpc_complete <- hpc_subset[complete.cases(hpc_subset),]

dateTime <- paste(hpc_complete$Date,hpc_complete$Time)

dateTime <- setNames(dateTime, "DateTime")

hpc_complete <- hpc_complete[,!(names(hpc_complete) %in% c("Date", "Time"))]

hpc_complete <- cbind(dateTime,hpc_complete)

hpc_complete$dateTime <- as.POSIXct(as.character(hpc_complete$dateTime, format = "%d/%m/%Y %H:%M:%S"))

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(hpc_complete$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(hpc_complete$Voltage, type = "l", ylab = "Voltage",xlab = "datetime")
plot(hpc_complete$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpc_complete$Sub_metering_2, col = "red")
lines(hpc_complete$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc_complete$Global_reactive_power, type = "l", ylab = "Glboal_reactive_power", xlab = "datetime")
dev.copy(png, file = "plot4.png")