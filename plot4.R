plot4 <- function() {
  ## Read in data
  powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings="?")
  powerdata[,1] <- as.Date(powerdata[,1], "%d/%m/%Y")
  powerdata <- subset(powerdata, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  ## Convert Date to data/time 
  powerdata$Date <- strptime(paste(powerdata$Date,powerdata$Time), "%Y-%m-%d%H:%M:%S")
  ## Create png file for results
  png("plot4.png", width = 480, height= 480)
  
  ## Set up for four plots
  par(mfrow=c(2,2))
  ## Make plot
  with (powerdata, {
    plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Date, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
    plot(powerdata$Date, powerdata$Sub_metering_1, type = "l", xlab ="", ylab = "")
    lines(powerdata$Date, powerdata$Sub_metering_2, type = "l", xlab ="", ylab = "", col = "red")
    lines(powerdata$Date, powerdata$Sub_metering_3, type = "l",xlab ="", ylab = "", col = "blue")
    title(ylab = "Energy sub metering")
    ##set up legend
    legendlabels <- c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
    legend(x = "topright", legend = legendlabels, lty = c(1,1,1), lwd=c(1,1,1),col=c("black","red","blue"))
    plot(Date, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  })
  
  dev.off()
}