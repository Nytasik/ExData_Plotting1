#First read the data from file

cc<-c("character","character","numeric","numeric",
      "numeric","numeric","numeric","numeric","numeric")
cn<-c("Date","Time","Global_active_power",
      "Global_reactive_power","Voltage","Global_intensity",
      "Sub_metering_1","Sub_metering_2","Sub_metering_3")
a<-read.table("household_power_consumption.txt",sep=";",
              skip=66637,nrows=2880,col.names=cn, colClasses=cc)

dt<-strptime(paste(a[,1],a[,2]),"%d/%m/%Y %H:%M:%S")

#Second, open a destination file for saving our plot
png(file="plot4.png",width = 480, height = 480)

#Setup count of plot and how they will appear
par(mfrow=c(2,2))

#Build a first plot
plot(dt, a[,3],type="l",xlab="",ylab="Global Active Power",
     bg="transparent")

#Build a second plot
plot(dt,a[,5],type="l",xlab="datetime",ylab="Voltage",
     bg="transparent")

#Build a third plot
plot(dt,a$Sub_metering_1, col="black",xlab="",
     ylab="Energy sub metering", type="l", bg="transparent")
lines(dt,a$Sub_metering_2, col="red")
lines(dt , a$Sub_metering_3, col="blue")

#Build a fourth plot
plot(dt, a[,4],type="l",xlab="datetime",ylab="Global_reactive_power",
     bg="transparent")

#Close the destination file
dev.off()