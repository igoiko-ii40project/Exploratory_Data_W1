################### PLot 1 ########################
# File: plot1.R
###################################################

setwd("G:/My Drive/Learning_Courses/DataScience/DataSience_Especialization_Johns_Hopkins/Course4_Exploratory_Data_Analysis/Notes_Homework")
power_consumption<-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(power_consumption)
head(power_consumption)
power_consumption$Timestamp<-strptime(paste(power_consumption$Date, power_consumption$Time), format = "%d/%m/%Y %H:%M:%S")
power_consumption$Date<-as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_period<-subset(power_consumption, (Date =="2007-02-01") | (Date =="2007-02-02"))

#Plot_1
dev.off()
plot.new()
dev.copy(png, file="plot1.png", width=480, height=480)
hist(power_period$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

