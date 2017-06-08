plot(hpc_complete$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpc_complete$Sub_metering_2, col = "red")
lines(hpc_complete$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))