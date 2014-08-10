

plot1 <- function() {
  
## Read in data
  powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings="?")
  powerdata[,1] <- as.Date(powerdata[,1], "%d/%m/%Y")
  powerdata <- subset(powerdata, Date >= "2007-02-01" & Date <= "2007-02-02")
  powerdata[,3] <- as.numeric(powerdata[,3])
  png("plot1.png", width = 480, height= 480)
  hist(powerdata$Global_active_power, freq = TRUE, col = "red", main = "Glabal Active Power", xlab = "Global Active Power (kilowatts)")
  
  dev.off()
}