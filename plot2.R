#plot2 

#lubridate library is needed

plot2<-function(){

library(lubridate)

Sys.setlocale("LC_TIME", "en_US.UTF-8")

#reads the data and convert date and time to POSIXct objects

data<-read.table("household_power_consumption.txt", skip=grep("31/1/2007;23:59:00",
                                                              readLines("household_power_consumption.txt")),sep=";", nrows=2880)

varname<-read.table("household_power_consumption.txt", nrows=1, sep=";", header=TRUE)

names(data)<-names(varname)

data$DateTime <- dmy_hms(paste(data$Date, data$Time))



#Create plot2 to file in current working directory
png(file = "plot2.png", width=480,height=480,bg = "transparent")
plot(data$DateTime, data$Global_active_power,type ="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()

}