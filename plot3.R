# load master electrical data
electricaldata <- read.table('household_power_consumption.txt',sep=";",header=TRUE,na.strings=c("?"))
electricaldata$Date <- as.Date(electricaldata$Date,"%d/%m/%Y")
# create subset for 2007-02-01 and 2007-02-02
elecdata <- subset(electricaldata,Date=="2007-02-01" | Date=="2007-02-02")
# create a merged timestamp column
elecdata <- within(elecdata, {timestamp = paste(Date,Time)})
elecdata$timestamp <- strptime(elecdata$timestamp,format="%Y-%m-%d %H:%M:%S")

#plot 3
png(file = "plot3.png", width =480, height = 480)
plot(elecdata$timestamp,elecdata$Sub_metering_1,xlab = "",ylab ="Energy  sub metering", type="n")
with(elecdata,lines(timestamp,Sub_metering_1))
with(elecdata,lines(timestamp,Sub_metering_2,col="red"))
with(elecdata,lines(timestamp,Sub_metering_3,col="blue"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()