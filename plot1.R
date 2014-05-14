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
png(file="plot1.png",width = 480, height = 480)

#Build a plot

hist(a[,3],main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",col="red",bg="transparent")

#Close the destination file
dev.off()