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

## PLOT 2
## Open PNG device
png(filename = "./Week 1/plot2.png",width = 480, height = 480, units = "px")
## Make plot and lines to device
with(powerdf, 
     plot(Time, Global_active_power, 
          xlab="", 
          ylab="Global Active Power (kilowatts)", 
          type = "n")
)
with(powerdf, 
     lines(Time, Global_active_power)
)
## Close device
dev.off()

