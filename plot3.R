#Plot 3

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

png(file="plot3.png",width=480,height=480)

plot(hpc$DateTime,
     as.numeric(hpc$Sub_metering_1),
    #main="",
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")

lines(hpc$DateTime,
      as.numeric(hpc$Sub_metering_2),
      type="l",
      col="red")

lines(hpc$DateTime,
      as.numeric(hpc$Sub_metering_3),
      type="l",
      col="blue")

legend("topright", 
       lty=1,
       col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()

