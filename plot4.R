## El siguiente lee convenientemente Fecha y Hora como texto, números como numéricos
## Es la válida
powerdf <- read.table("./Week 1/household_power_consumption.txt", 
                      header=TRUE, sep = ";", na.strings = "?", 
                      stringsAsFactors = FALSE)

## Subsets DF con fechas 2007-02-01 (01/02/2007)and 2007-02-02 (02/02/2007)
## Resultado: 2880 filas
powerdf <- subset(powerdf, (as.Date(Date, format="%d/%m/%Y") == 
                              as.Date("01/02/2007", format="%d/%m/%Y")) |
                    (as.Date(Date, format="%d/%m/%Y") == 
                       as.Date("02/02/2007", format="%d/%m/%Y")) )
## Columna Time con formato FechaHora
powerdf$Time <- strptime(paste(powerdf$Date, powerdf$Time), 
                         "%d/%m/%Y %H:%M:%S")
## Columna Date con formato Fecha 
powerdf$Date <- as.Date(powerdf$Date, format("%d/%m/%Y"))
## Read data file to data frame, NA string controlled and 
powerdf <- read.table("./Week 1/household_power_consumption.txt", 
                      header=TRUE, sep = ";", na.strings = "?", 
                      stringsAsFactors = FALSE)

## Subsets data frame for dates 2007-02-01 and 2007-02-02
## Resultado: 2880 filas
powerdf <- subset(powerdf, (as.Date(Date, format="%d/%m/%Y") == 
                              as.Date("01/02/2007", format="%d/%m/%Y")) |
                    (as.Date(Date, format="%d/%m/%Y") == 
                       as.Date("02/02/2007", format="%d/%m/%Y")) )
## Convert string format Time 
powerdf$Time <- strptime(paste(powerdf$Date, powerdf$Time), 
                         "%d/%m/%Y %H:%M:%S")
## Convert date format Time  
powerdf$Date <- as.Date(powerdf$Date, format("%d/%m/%Y"))


## PLOT 4
## Open PNG device
png(filename = "./Week 1/plot4.png",width = 480, height = 480, units = "px")
## Make plot and lines to device
par(mfrow = c(2, 2))
with(powerdf, {
  plot(Time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "n")
  lines(Time, Global_active_power)
  plot(Time, Voltage, xlab="datetime", ylab="Voltage", type = "n")
  lines(Time, Voltage)
  plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n")
  lines(Time, Sub_metering_1)
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue") 
  legend("topright", lty=c(1,1,1), 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex=0.6)
  plot(Time, Global_reactive_power, xlab="datetime", type = "n")
  lines(Time, Global_reactive_power)
}
)
## Close device
dev.off()