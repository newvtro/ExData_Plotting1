# English isn't my mother language so I hope ypu can understand my code
household <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
Sys.setlocale("LC_TIME", "C")
household$Date_Time <- strptime(paste(household$Date,household$Time), format="%d/%m/%Y %H:%M:%S")
subs<-  household[(as.Date(household$Date_Time)>="2007-02-01" & as.Date(household$Date_Time)<="2007-02-02"),]
# We only keep the data we need
rm(household)
subs$Global_active_power<-as.numeric(subs$Global_active_power)
png(filename="plot3.png", width=480,height=480)
with(subs, plot(Date_Time, Sub_metering_1, type="l", col="black", xlab="", ylab="Energu sub metering"))
with(subs,lines(Date_Time, Sub_metering_2, col="red"))
with(subs,lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off();