## This code assumes that the text file containing the dataset is in your
## working directory

# load in data
cpdata <- read.table('household_power_consumption.txt', stringsAsFactors=F,
	sep=";", header=T)
	
# extract the relevant data
extLogical <- cpdata$Date == "1/2/2007" | cpdata$Date == "2/2/2007"
cpdataSubset <- cpdata[extLogical, ]

# create plot
png('plot3.png')
plot(as.numeric(cpdataSubset$Sub_metering_1), type="l", 
	ylab="Energy sub metering", xlab="", xaxt='n')
lines(as.numeric(cpdataSubset$Sub_metering_2), col="red")
lines(as.numeric(cpdataSubset$Sub_metering_3), col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	lty=1, col=c('black', 'red', 'blue'))
axis(side=1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
 