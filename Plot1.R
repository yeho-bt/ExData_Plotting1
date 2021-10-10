library("data.table")

setwd("~/Documents/Coursera/Exploratory_Data_Science/Course_Project_1/exdata_data_household_power_consumption")

#Reads in data from file
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Make histogram not use scientific notation 
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filtering Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plotting Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()