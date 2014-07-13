# English isn't my mother language, so I hope you can understand me
# Import dataset
household <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
Sys.setlocale("LC_TIME", "C")
household$Date_Time <- strptime(paste(household$Date,household$Time), format="%d/%m/%Y %H:%M:%S")
subs<-  household[(as.Date(household$Date_Time)>="2007-02-01" & as.Date(household$Date_Time)<="2007-02-02"),]
# We just keep the data we need
rm(household)
subs$Global_active_power<-as.numeric(subs$Global_active_power)
png(filename="plot4.png", width=480,height=480)
#Multiple base plots
par(mfrow=c(2,2))
# 1 - 4
with(subs, plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
# 2 - 4
with(subs,plot(Date_Time, Voltage, type="l", xlab="datetime"))
# 3 - 4
with(subs, plot(Date_Time, Sub_metering_1, type="l", col="black", xlab="", ylab="Energu sub metering"))
with(subs,lines(Date_Time, Sub_metering_2, col="red"))
with(subs,lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", lwd=1, bty="n",col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# 4 -4 
with(subs, plot(Date_Time, Global_reactive_power, type="l", xlab="datetime"))
# Export PNG  
dev.off();