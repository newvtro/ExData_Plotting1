# English isn't my mother language so I hope you can understand me
household <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
Sys.setlocale("LC_TIME", "C")
household$Date_Time <- strptime(paste(household$Date,household$Time), format="%d/%m/%Y %H:%M:%S")
subs<-  household[(as.Date(household$Date_Time)>="2007-02-01" & as.Date(household$Date_Time)<="2007-02-02"),]
# We only keep the data we need
rm(household)
subs$Global_active_power<-as.numeric(subs$Global_active_power)
png(filename="plot2.png", width=480,height=480)
with(subs, plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off();