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
Datetime <- strptime(data1$DateTime, "%d/%m/%Y %H:%M:%S")

#making the plot
with(plot(Datetime,as.numeric(as.character(data1$Global_active_power)), type ="l", ylab ="Global Active Power", xlab = " "))

#Saving in the PNG file
png(filename = "Plot2.png", width = 480, height = 480)
with(plot(Datetime,as.numeric(as.character(data1$Global_active_power)), type ="l", ylab ="Global Active Power", xlab = " "))
dev.off()


