
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


# free some memory, removing main dataset

rm(AllData)

# Define format and name of file and generate the plot

png("plot1.png")

hist(DataFeb$Global_active_power,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()

#
# End of program
#

