setwd("C:/Users/ABC/datasciencecoursera/ExData_Plotting1")
loc=paste0(getwd(),"/household_power_consumption.txt")
classes=c(rep("character",2),rep("numeric",7))
power<-read.table(loc, sep = ";", header = TRUE, stringsAsFactors = FALSE)
power$Date<-as.Date(power$Date,format = "%d/%m/%Y")
powerFeb=subset(power, Date ==  "2007-02-01"| Date== "2007-02-02",na.rm=TRUE)
powerFeb$Time<-format(powerFeb$Time,format = "%H:%M:%S")
powerFeb$GLobal_active_power<-as.integer(powerFeb$GLobal_active_power)
for(i in 4:9){
        powerFeb[,i]<-as.numeric(powerFeb[,i])
}
rm(i,classes,power)
head(powerFeb)
dateTime<-paste(powerFeb$Date,powerFeb$Time)
powerFeb$dateTime<-as.POSIXct(dateTime)
plot(powerFeb$Sub_metering_1~powerFeb$dateTime,type="l",
     ylab="Energy sub metering", xlab="", col= "black")
points(powerFeb$Sub_metering_2~powerFeb$dateTime,type="l",
       ylab="Energy sub metering", xlab="", col= "red")
points(powerFeb$Sub_metering_3~powerFeb$dateTime,type="l",
       ylab="Energy sub metering", xlab="", col= "blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1, lty=c(1,1,1),
       pch=c(NA,NA,NA))
##Default size of the image is 480x480; so no need to specify
dev.copy(png,file="plot3.png")
dev.off()
## Just wanted to check the plot before making a PNG file out of it