## GETTING FULL DATASET
rm(list=ls()) 
data_full <- read.csv("c:/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

object.size(data_full) # SIZE OF OBJECT
sort( sapply(ls(),function(x){object.size(get(x))}))
memory.profile() 
memory.size() # MEMORY SIZE OBJECT
memory.size(max=TRUE) # MEMORY MAX SIZE 

dim(data_full)
names(data_full)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y") 

 ## SUBSETTING THE DATA
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data_full) 
  
## CONVERTING DATES
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 
  
## PLOT 1
hist(data$Global_active_power, main="GLOBAL ACTIVE POWER (fredycar)",  
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
  
## SAVING TO FILE
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
