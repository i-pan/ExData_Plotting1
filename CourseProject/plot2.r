## This code assumes that the text file containing the dataset is in your
## working directory

# load in data
cpdata <- read.table('household_power_consumption.txt', stringsAsFactors=F,
	sep=";", header=T)
	
# extract the relevant data
extLogical <- cpdata$Date == "1/2/2007" | cpdata$Date == "2/2/2007"
cpdataSubset <- cpdata[extLogical, ]

# create plot
png('plot2.png')
plot(as.numeric(cpdataSubset$Global_active_power), type="l", ylab="Global Active
	Power (kilowatts)", xlab="", xaxt='n') 
axis(side=1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()