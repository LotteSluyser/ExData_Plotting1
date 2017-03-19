## Exploratory analysis week 1 assignment - Plot 1
setwd("~/Desktop/coursera/Datascience cursus 4/Assignment 1")
dat<- read.table("household_power_consumption.txt", sep=";", 
                 header=TRUE, stringsAsFactors = F, na.string="?")
## this avoids data becoming factors or chr
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
## head(grep("2007-02-01",dat$Date)) shows the 1st row: 66637
## tail(grep("2007-02-02",dat$Date)) shows the last row: 69516
dat1<- dat[66637:69516,]
## plot histogram
hist(dat1$Global_active_power,col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
## make png file
dev.copy(png, file="plot1.png", width=480,height=480)
dev.off()