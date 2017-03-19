## Exploratory data analysis, assignment 1, plot 4
setwd("~/Desktop/coursera/Datascience cursus 4/Assignment 1")
dat<- read.table("household_power_consumption.txt", sep=";", 
                 header=TRUE, stringsAsFactors = F, na.string="?")
## take right dates
dat1<- dat[66637:69516,]
dt <- strptime(paste(dat1$Date, dat1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime<- cbind(dt,dat1)
## make set up for the 4 plots
par(mfrow=c(2,2), mar=c(5,4,2,1))
with(datetime, plot(dt,Global_active_power, type="s",
                    ylab="Global Active Power", xlab="" ))

with(datetime, plot(dt,Voltage, type="s",
                    ylab="Voltage", xlab="datetime" ))
with(datetime, plot(dt,Sub_metering_2, type="s",
                    ylab="Energy sub metering", xlab="",col="red", 
                    ylim=c(0,38)))
with(datetime, lines(dt, Sub_metering_3, col="blue"))
with(datetime, lines(dt, Sub_metering_1, col="black"))
legend('topright', lty = 1, bty="n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       y.intersp=0.05, cex=0.5)
with(datetime, plot(dt,Global_reactive_power, type="s",
                    ylab="Global_reactive_power", xlab="datetime" ))
## make png file
dev.copy(png,"plot4.png", height=480, width=480)
dev.off()

