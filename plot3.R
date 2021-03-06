###########################
# Exploratory Data Analysis: Assignment 1
###########################
#plot3.R  creates plot3.png 

#download data  
#commented out because assignment starts from unzipped local file 
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
#add a date/time column
data_subset$datetime <-strptime(paste(data_subset$Date, data_subset$Time), format ="%d/%m/%Y %H:%M:%S")

#set up graph labels
y_label <- "Energy sub metering"
x_label <- ""

#open png file
png("plot3.png",width = 480, height = 480)

#draw the graph
plot( data_subset$datetime,data_subset$Sub_metering_1, type="l", ylab = y_label, xlab= x_label)
lines( data_subset$datetime,data_subset$Sub_metering_2, data_subset$Sub_metering_2, type = "l", col = "red")
lines( data_subset$datetime,data_subset$Sub_metering_3, data_subset$Sub_metering_3, type = "l", col = "blue")

#write to file
dev.off()
