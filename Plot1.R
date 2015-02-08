##Requirement
#Loading the data
#When loading the dataset into R, please consider the following:
#  The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
#Note that in this dataset missing values are coded as ?.

#Making Plots
#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
#First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

#For each plot you should
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Name each of the plot files as plot1.png, plot2.png, etc.
#Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
#Add the PNG file and R code file to your git repository
#When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files.
#The four plots that you will need to construct are shown below.

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

## Plot 1
hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()