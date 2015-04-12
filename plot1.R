#plot1.R

plot1<-function(){

#lubridate library is needed
library(lubridate)

Sys.setlocale("LC_TIME", "en_US.UTF-8")

#reads the data and convert date and time to POSIXct objects

data<-read.table("household_power_consumption.txt", skip=grep("31/1/2007;23:59:00",
                readLines("household_power_consumption.txt")),sep=";", nrows=2880)

varname<-read.table("household_power_consumption.txt", nrows=1, sep=";", header=TRUE)

names(data)<-names(varname)

data$DateTime <- dmy_hms(paste(data$Date, data$Time))



##Create plot1 to file in current working directory
png(file = "plot1.png", width=480,height=480,bg = "transparent")

hist(data$Global_active_power, breaks=12, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()

}


