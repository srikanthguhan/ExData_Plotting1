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
plot(powerFeb$Global_active_power~powerFeb$dateTime,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
##Default size of the image is 480x480; so no need to specify
dev.copy(png,file="plot2.png")
dev.off()
## Just wanted to check the plot before making a PNG file out of it