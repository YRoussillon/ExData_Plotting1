# load master electrical data
electricaldata <- read.table('household_power_consumption.txt',sep=";",header=TRUE,na.strings=c("?"))
electricaldata$Date <- as.Date(electricaldata$Date,"%d/%m/%Y")
# create subset for 2007-02-01 and 2007-02-02
elecdata <- subset(electricaldata,Date=="2007-02-01" | Date=="2007-02-02")
# create a merged timestamp column
elecdata <- within(elecdata, {timestamp = paste(Date,Time)})
elecdata$timestamp <- strptime(elecdata$timestamp,format="%Y-%m-%d %H:%M:%S")

# plot 2
png(file = "plot2.png", width =480, height = 480)
plot(elecdata$timestamp,elecdata$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(elecdata$timestamp,elecdata$Global_active_power)
dev.off()