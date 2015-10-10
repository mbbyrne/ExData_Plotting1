#Plot 1

#Read in source data file from working directory

hpc_full<-read.csv(file="household_power_consumption.txt",
                   header=TRUE,
                   quote="",
                   sep=";",
                   stringsAsFactors=F,
                   na.strings="?")

#Subset data frame to keep the dates of interest

hpc<-hpc_full[hpc_full$Date %in%  c('1/2/2007','2/2/2007'), ]

#Create datetime variable from Date and Time Columns

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),format="%Y-%m-%d %H:%M:%S")

#Create plot and output to working directory

png(file="plot1.png",width=480,height=480)

hist(as.numeric(hpc$Global_active_power),
     main="Global Active Power",
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()