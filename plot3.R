#First read the data from file

cc<-c("character","character","numeric","numeric",
      "numeric","numeric","numeric","numeric","numeric")
cn<-c("Date","Time","Global_active_power",
      "Global_reactive_power","Voltage","Global_intensity",
      "Sub_metering_1","Sub_metering_2","Sub_metering_3")
a<-read.table("household_power_consumption.txt",sep=";",
              skip=66637,nrows=2880,col.names=cn, colClasses=cc)

#Second, open a destination file for saving our plot
png(file="plot3.png",width = 480, height = 480)

#Build a plot
plot(dt,a$Sub_metering_1, col="black",xlab="",
     ylab="Energy sub metering", type="l", bg="transparent")

lines(dt,a$Sub_metering_2,col="red")
lines(dt , a$Sub_metering_3, col="blue")
#Add legend
legend("topright",col = c("black","red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", 
                "Sub_metering_3"),lty=1)

#Close the destination file
dev.off()