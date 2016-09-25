setwd("C:\\Users\\wx5157\\Desktop\\Data Science Training\\Coursera\\Course 4 EDA")

## Read in the Data Only for the time period of interest##

data=read.table("household_power_consumption.txt", header=F, sep=";", stringsAsFactors = F, skip=66637, nrows=2880)
head(data)
str(data)
names=read.table("household_power_consumption.txt", header=F, sep=";", stringsAsFactors = F, nrows=1)
colnames(data) = names[1,]

## Convert the date & time column into 1 datetime column

data$datetime = paste(data$Date, data$Time, sep = "-")
data$datetime = strptime(data$datetime, "%d/%m/%Y-%H:%M:%S")
data$Date=as.Date(data$Date, "%d/%m/%Y")

data$datetime2 = as.Date(data$datetime)

##Plot 1 ##

png(file="plot 1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatt)")
dev.off()