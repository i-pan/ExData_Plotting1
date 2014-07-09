## This code assumes that the text file containing the dataset is in your
## working directory

# load in data
cpdata <- read.table('household_power_consumption.txt', stringsAsFactors=F,
	sep=";", header=T)
	
# extract the relevant data
extLogical <- cpdata$Date == "1/2/2007" | cpdata$Date == "2/2/2007"
cpdataSubset <- cpdata[extLogical, ]

# create plot
png('plot1.png')
hist(as.numeric(cpdataSubset$Global_active_power), breaks=12, ylab="Frequency", 
	xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
