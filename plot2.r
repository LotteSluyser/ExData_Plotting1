## Exploratory analysis week 1 assignment - Plot 2
setwd("~/Desktop/coursera/Datascience cursus 4/Assignment 1")
dat<- read.table("household_power_consumption.txt", sep=";", 
                 header=TRUE, stringsAsFactors = F, na.string="?")
## subset only rows with the right dates, as established with plot1.r
dat1<- dat[66637:69516,]
## combine date and time in the right format
dt <- strptime(paste(dat1$Date, dat1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime<- cbind(dt,dat1)
with(datetime, plot(dt,Global_active_power, type="s",
                    ylab="Global Active Power (kilowatts)", xlab="" ))
##s=scatter
## make png
dev.copy(png, file="plot2.png", width=480,height=480)
dev.off()