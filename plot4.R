#plot4

plot4<-function(){

#lubridate library is needed
library(lubridate)

Sys.setlocale("LC_TIME", "en_US.UTF-8")

#reads the data and convert date and time to POSIXct objects

data<-read.table("household_power_consumption.txt", skip=grep("31/1/2007;23:59:00",
                                                              readLines("household_power_consumption.txt")),sep=";", nrows=2880)

varname<-read.table("household_power_consumption.txt", nrows=1, sep=";", header=TRUE)

names(data)<-names(varname)

data$DateTime <- dmy_hms(paste(data$Date, data$Time))


#Create plot4 to file in current working directory
png(file = "plot4.png", width=480,height=480,bg = "transparent")
par(mfrow=c(2,2))
with(data, {
        plot(data$DateTime, data$Global_active_power,type ="n", xlab="", ylab="Global Active Power (kilowatts)")
        lines(data$DateTime, data$Global_active_power)
        plot(data$DateTime, data$Voltage,type ="n", xlab="", ylab="Voltage")
        lines(data$DateTime, data$Voltage)
        plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
        lines(DateTime, Sub_metering_1, col="black")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright",pch="_", col=c("black","red","blue"), 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(data$DateTime, data$Global_reactive_power,type ="n", xlab="", ylab="Global Reactive Power")
        lines(data$DateTime, data$Global_reactive_power)
        
        
})

dev.off()

}
