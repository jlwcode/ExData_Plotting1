plot3 <- function() {
  ## Read in data
  powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings="?")
  powerdata[,1] <- as.Date(powerdata[,1], "%d/%m/%Y")
  powerdata <- subset(powerdata, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  ## Convert Date to data/time 
  powerdata$Date <- strptime(paste(powerdata$Date,powerdata$Time), "%Y-%m-%d%H:%M:%S")
  ## Create png file for results
  png("plot3.png", width = 480, height= 480)
  ## Make plot
  plot(powerdata$Date, powerdata$Sub_metering_1, type = "l", xlab ="", ylab = "")
  lines(powerdata$Date, powerdata$Sub_metering_2, type = "l", xlab ="", ylab = "", col = "red")
  lines(powerdata$Date, powerdata$Sub_metering_3, type = "l",xlab ="", ylab = "", col = "blue")
  title(ylab = "Energy sub metering")
  ##set up legend
  legendlabels <- c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
  legend(x = "topright", legend = legendlabels, lty = c(1,1,1), lwd=c(1,1,1),col=c("black","red","blue"))
  dev.off()
}