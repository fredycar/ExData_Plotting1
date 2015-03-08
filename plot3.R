## GETTING FULL DATASET
data_full <- read.csv("c:/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y") 
  
## SUBSETTING THE DATA
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data_full) 
  
## CONVERTING DATES
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 
  
## PLOT 3
with(data, { 
plot(Sub_metering_1~Datetime, type="l", 
ylab="Global Active Power (kilowatts)", xlab="") 
lines(Sub_metering_2~Datetime,col='Red') 
lines(Sub_metering_3~Datetime,col='Blue') 
}) 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  
## SAVING TO FILE
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
