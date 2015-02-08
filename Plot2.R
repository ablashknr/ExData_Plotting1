###Refer to Plot1.R for Question

###Solution
### Checks to see if the folder is created or not
if (!file.exists("./Track4Project1")){dir.create("./Track4Project1")}

### Downloads the file 
##fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##download.file(fileURL, destfile="./Track4Quiz1/Track4Quiz1.zip", method="auto")

#import the whole dataset
data <- read.csv("./Track4Project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Remove data to free up memory resource
rm(data)

## Converting dates
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(subdata$Datetime, subdata$Global_active_power,  type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()