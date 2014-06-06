###########################
# Exploratory Data Analysis: Assignment 1
###########################
#plot4.R  creates plot4.png 

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
y_label_r1c1 <- "Global Active Power"
y_label_r1c2 <- "Voltage"
y_label_r2c1 <- "Energy sub metering"
y_label_r2c2 <- "Global_reactive_power"
x_label_r1c1 <- ""
x_label_r1c2 <- "datetime"
x_label_r2c1 <- ""
x_label_r2c2 <- "datetime"

#open png file
png("plot4.png",width = 480, height = 480)

#draw the graphs
#set up grid 2 rows by 2 columns
par(mfrow=c(2,2))

#row1col1 is from plot 2
plot( data_subset$datetime,data_subset$Global_active_power, type="l", ylab = y_label_r1c1, xlab= x_label_r1c1)

#row1col2
plot( data_subset$datetime,data_subset$Voltage, type="l", ylab = y_label_r1c2, xlab= x_label_r1c2)

#row2co1 is from plot 3
plot( data_subset$datetime,data_subset$Sub_metering_1, type="l", ylab = y_label_r2c1, xlab= x_label_r2c1)
lines( data_subset$datetime,data_subset$Sub_metering_2, data_subset$Sub_metering_2, type = "l", col = "red")
lines( data_subset$datetime,data_subset$Sub_metering_3, data_subset$Sub_metering_3, type = "l", col = "blue")

#row2col2
plot( data_subset$datetime,data_subset$Global_reactive_power, type="l", ylab = y_label_r2c2, xlab= x_label_r2c2)


#write to file
dev.off()
