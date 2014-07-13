# English isn't my mother language, so I hope you cand understand me
household <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
household$Date <- as.Date(household$Date, format="%d/%m/%Y")
subs<-  household[(household$Date>="2007-02-01" & household$Date<="2007-02-02"),]
# We only keep the data we need
rm(household)
subs$Global_active_power<-as.numeric(subs$Global_active_power) # Character -> Numeric
png(filename="plot1.png", width=480,height=480)
with(subs,hist(Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red"))
dev.off();
