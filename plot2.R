## GETTING FULL DATASET 
data_full <- read.csv("c:/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
dim(data_full)
names(data_full)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y") 
  
## SUBSETTING THE DATA
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

rm(data_full) 

## CONVERTING DATES 
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 
  
## PLOT 2 
plot(data$Global_active_power~data$Datetime, type="l", 
ylab="Global Active Power (kilowatts)", xlab="") 
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
