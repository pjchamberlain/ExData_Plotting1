###########################
# Exploratory Data Analysis: Assignment 1
###########################
#plot1.R  creates plot1.png 

#download data  

## commented out - assignment starts from unzipped local file 
#use http instead of https
#url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#local_file <- "household_power_consumption.zip"
#data_file <- download.file(url, local_file)
#unzip(local_file)

#read unzipped local file into R
extracted_file <- "household_power_consumption.txt"
data <- read.csv(extracted_file, sep = ";", na.strings = "?")
#get the subset for dates 1 to 2 Feb 2007
data_subset <- data[data$Date == "1/2/2007"| data$Date == "2/2/2007",]

#set up graph labels
x_label <- "Global Active Power (kilowatts)"
y_label <- "Frequency"
title <- "Global Active Power"

#open png file
png("plot1.png",width = 480, height = 480)

#draw chart
hist(data_subset$Global_active_power, col="red", xlab = x_label, ylab = y_label, main = title)

#write to a png file
dev.off()
