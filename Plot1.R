temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";")
unlink(temp)

data1 = subset(data, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")
rm(data)

#making the histogram
hist(as.numeric(as.character(data1$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts) ")

#Saving in the PNG file
png(filename = "Plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(data1$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts) ")
dev.off()
