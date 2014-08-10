plot2 <- function() {
  ## Read in data
  powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings="?")
  powerdata[,1] <- as.Date(powerdata[,1], "%d/%m/%Y")
  powerdata <- subset(powerdata, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  ## Convert Date to data/time 
  powerdata$Date <- strptime(paste(powerdata$Date,powerdata$Time), "%Y-%m-%d%H:%M:%S")
  ## Create png file for results
  png("plot2.png", width = 480, height= 480)
  ## Make plot
  plot(powerdata$Date, powerdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  ## Close plot
  dev.off()
}