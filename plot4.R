################### PLot 4 ########################
# File: plot4.R
###################################################

setwd("G:/My Drive/Learning_Courses/DataScience/DataSience_Especialization_Johns_Hopkins/Course4_Exploratory_Data_Analysis/Notes_Homework")
power_consumption<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(power_consumption)
head(power_consumption)
power_consumption$Timestamp<-strptime(paste(power_consumption$Date, power_consumption$Time), format = "%d/%m/%Y %H:%M:%S")
power_consumption$Date<-as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_period<-subset(power_consumption, (Date =="2007-02-01") | (Date =="2007-02-02"))

#Plot_4
dev.off()
plot.new()
par(mfrow=c(2,2),mar=c(4,4,2,1))  #define combination of plots (2 rows, 1 col) & margins
dev.copy(png, file="plot4.png", width=480, height=480)
#top_left
plot(power_period$Timestamp, power_period$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#top_right
plot(power_period$Timestamp, power_period$Voltage, type="l", xlab="", ylab="Voltage")
#bottom_left
plot(power_period$Timestamp, power_period$Sub_metering_1, type="n", ylab="Energy sub metering")
points(power_period$Timestamp, power_period$Sub_metering_1, pch=19, type="l", ylab="Energy sub metering", col="black")
points(power_period$Timestamp, power_period$Sub_metering_2, pch=19, type="l", ylab="Energy sub metering", col="red")
points(power_period$Timestamp, power_period$Sub_metering_3, pch=19, type="l", ylab="Energy sub metering", col="blue")
legend("topright", lty=1, lwd=2, col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bottom_right
plot(power_period$Timestamp, power_period$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
