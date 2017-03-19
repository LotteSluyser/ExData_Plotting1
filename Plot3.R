## Exploratory analysis week 1 assignment - Plot 3
setwd("~/Desktop/coursera/Datascience cursus 4/Assignment 1")
dat<- read.table("household_power_consumption.txt", sep=";", 
                 header=TRUE, stringsAsFactors = F, na.string="?")
## limit to the rows of the right dates
dat1<- dat[66637:69516,]
dt <- strptime(paste(dat1$Date, dat1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime<- cbind(dt,dat1)

with(datetime, plot(dt,Sub_metering_2, type="s",
                    ylab="Energy sub metering", xlab="",col="red", 
                    ylim=c(0,38)))
##ylim sets the scale of the y-axis
with(datetime, lines(dt, Sub_metering_3, col="blue"))
with(datetime, lines(dt, Sub_metering_1, col="black"))
legend('topright', ex.cs1, lty = 1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       adj = c(0, 1, 8), cex=0.6, y.intersp = 0.3) 

dev.copy(png, file="plot3.png", width=480,height=480)
dev.off()
