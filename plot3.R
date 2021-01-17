################### PLot 3 ########################
# File: plot3.R
###################################################

setwd("G:/My Drive/Learning_Courses/DataScience/DataSience_Especialization_Johns_Hopkins/Course4_Exploratory_Data_Analysis/Notes_Homework")
power_consumption<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(power_consumption)
head(power_consumption)
power_consumption$Timestamp<-strptime(paste(power_consumption$Date, power_consumption$Time), format = "%d/%m/%Y %H:%M:%S")
power_consumption$Date<-as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_period<-subset(power_consumption, (Date =="2007-02-01") | (Date =="2007-02-02"))

#Plot_3
dev.off()
plot.new()
dev.copy(png, file="plot3.png", width=480, height=480)
plot(power_period$Timestamp, power_period$Sub_metering_1, type="n", ylab="Energy sub metering")
points(power_period$Timestamp, power_period$Sub_metering_1, pch=19, type="l", xlab="", ylab="Energy sub metering", col="black")
points(power_period$Timestamp, power_period$Sub_metering_2, pch=19, type="l", xlab="", ylab="Energy sub metering", col="red")
points(power_period$Timestamp, power_period$Sub_metering_3, pch=19, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", lty=1, lwd=2, col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#legend("topleft", legend=c("Line 1", "Line 2"), col=c("red", "blue"), lty=1:2, cex=0.8)
dev.off()

