setwd("C:/Users/ABC/datasciencecoursera/ExData_Plotting1")
loc=paste0(getwd(),"/household_power_consumption.txt")
classes=c(rep("character",2),rep("numeric",7))
power<-read.table(loc, sep = ";", header = TRUE, stringsAsFactors = FALSE)
power$Date<-as.Date(power$Date,format = "%d/%m/%Y")
power$Time<-format(power$Time,format = "%H:%M:%S")
power$GLobal_active_power<-as.integer(power$GLobal_active_power)
for(i in 4:9){
        power[,i]<-as.numeric(power[,i])
}
rm(i,classes,power)
head(power)
powerFeb=subset(power, Date ==  "2007-02-01"| Date== "2007-02-02")
hist(powerFeb[,3],breaks = 25,xlab = "Global Active Power (kilowatts)",
     col = "red",ylab="Frequency", main = "Global Active Power",
     ylim = c(0,1200),xlim=c(0,6))
dev.copy(png,file="plot1.png")
dev.off()
## Just wanted to check the plot before making a PNG file out of it