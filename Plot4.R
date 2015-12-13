#read data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";")
unlink(temp)

data1 = subset(data, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")
rm(data)

#transform in Date and Time
library("dplyr")
data1 <- mutate (data1, DateTime <- paste(Date, Time))

#ajusting the dates and stacking the data 
data1$Sub_metering_1 = as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 = as.numeric(as.character(data1$Sub_metering_2))

x = data.frame(data1[10], stack(data1[7:9]))
Datetime <- strptime(data1$DateTime, "%d/%m/%Y %H:%M:%S")
Datetime2 = strptime(x$DateTime....paste.Date..Time, "%d/%m/%Y %H:%M:%S")

#making the plot
par (mfrow = c(2,2))
plot(Datetime, as.numeric(as.character(data1$Global_active_power)), type ="l", ylab ="Global Active Power", xlab = " ", xaxt = "s")
plot(Datetime,  as.numeric(as.character(data1$Voltage)), type ="l", ylab ="Voltage", xlab = "datetime", xaxt = "s")
plot(Datetime2, x$values, type="n", xaxt = "s", xlab = "", ylab = "Energy sub metering")
  with(subset(x, ind == "Sub_metering_3"), lines (Datetime, values, col = "blue"))
  with(subset(x, ind == "Sub_metering_1"), lines (Datetime, values, col = "black"))
  with(subset(x, ind == "Sub_metering_2"), lines (Datetime, values, col = "red"))
legend("topright", lwd= 2, col = c("black","red", "blue"), legend = c("Sub_metering_1", " Sub_metering_2", "Sub_metering_3"))
plot(Datetime, as.numeric(as.character(data1$Global_reactive_power)), type ="l", ylab ="Global_reactive_power", xlab = "datetime", xaxt = "s")

#making the png file
png(filename = "Plot4.png", width = 480, height = 480)
par (mfrow = c(2,2))
plot(Datetime, as.numeric(as.character(data1$Global_active_power)), type ="l", ylab ="Global Active Power", xlab = " ", xaxt = "s")
plot(Datetime,  as.numeric(as.character(data1$Voltage)), type ="l", ylab ="Voltage", xlab = "datetime", xaxt = "s")
plot(Datetime2, x$values, type="n", xaxt = "s", xlab = "", ylab = "Energy sub metering")
with(subset(x, ind == "Sub_metering_3"), lines (Datetime, values, col = "blue"))
with(subset(x, ind == "Sub_metering_1"), lines (Datetime, values, col = "black"))
with(subset(x, ind == "Sub_metering_2"), lines (Datetime, values, col = "red"))
legend("topright", lwd= 2, col = c("black","red", "blue"), legend = c("Sub_metering_1", " Sub_metering_2", "Sub_metering_3"))
plot(Datetime, as.numeric(as.character(data1$Global_reactive_power)), type ="l", ylab ="Global_reactive_power", xlab = "datetime", xaxt = "s")
dev.off()
