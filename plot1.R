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

hist(hpc_complete$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
