
# Exploratory Data Analisys
# 
# This assignment uses data from the file “Individual household electric power consumption Data 
# Set” , from the UC Irvine Machine Learning Repository, a popular repository for machine 
# learning datasets. 
# 
#
# It generates a set of graphics to examine how household energy usage varies over 
# a 2-day period in February, 2007.
#
#
# Plot 1 - Histogram of Global Active Power
#
#
# Data source:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
#
#####
#
# Checking and installing needed packages
#
#
InstallLoadPackages <- function(needed_pkg){
  
  new_pkg <- needed_pkg[!(needed_pkg %in% installed.packages()[, "Package"])]
  
  if (length(new_pkg)) 
    install.packages(new_pkg, dependencies = TRUE)
  
  sapply(needed_pkg, require, character.only = TRUE)
}
#
# List of needed packages
#
needed_pkg <- c("data.table")

InstallLoadPackages(needed_pkg)


# Read all data and subset required dates

AllData <- fread(input = "household_power_consumption.txt", na.strings="?")

AllData$Date <- as.Date(AllData$Date,"%d/%m/%Y")

DataFeb <- subset(AllData, Date == "2007-02-01" | Date == "2007-02-02")

DataTimeFeb <- strptime(paste(DataFeb$Date,DataFeb$Time),"%Y-%m-%d %H:%M:%S")

# free some memory, removing main dataset

rm(AllData)

# Define format and name of file and generate the plot
# Attention: tha days´names are in Portuguese

png("plot4.png")

par(mfrow=c(2,2))

# First plot - copy of plot 2

plot(x=DataTimeFeb,y=DataFeb$Global_active_power,type="l", 
     xlab='', ylab="Global Active Power")

# Second plot 

plot(DataTimeFeb,DataFeb$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Third plot - copy of plot 3
# Days´names are in Portuguese

plot(DataTimeFeb, DataFeb$Sub_metering_1, type = "l", xlab = "", 
                                    ylab = "Energy sub metering")

lines(DataTimeFeb, DataFeb$Sub_metering_2, type = "l", col = "red")

lines(DataTimeFeb, DataFeb$Sub_metering_3, type = "l", col = "blue")

legend("topright", "(x,y)", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                             col=c("black", "red", "blue"), lty=1, cex = 0.6)


# Fourth plot

plot(DataTimeFeb, DataFeb$Global_reactive_power, type="l", xlab="datetime", 
                                               ylab="Global_reactive_power")


dev.off()

#
# End of program
#

