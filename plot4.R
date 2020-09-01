#Leer datos
Datos <- read.table("household_power_consumption.txt", sep = ";",skip = 1)
names(Datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

a<-paste(Datos$Date, Datos$Time, sep=" ")
Mergedatetime <- strptime(a, "%d/%m/%Y %H:%M:%S")

analisisdata <- cbind(Datos, Mergedatetime)

Subdatos <- analisisdata[analisisdata$Date %in% c("1/2/2007","2/2/2007"),]

str(Subdatos)
Subdatos$Date <- as.Date(Subdatos$Date, format = "%d/%m/%Y")
Subdatos$Time <- format(Subdatos$Time, format = "%H:%M:%S")
Subdatos$Global_active_power <- as.numeric(Subdatos$Global_active_power)
Subdatos$Global_reactive_power <- as.numeric(Subdatos$Global_reactive_power)
Subdatos$Voltage <- as.numeric(Subdatos$Voltage)
Subdatos$Global_intensity <- as.numeric(Subdatos$Global_intensity)
Subdatos$Sub_metering_1 <- as.numeric(Subdatos$Sub_metering_1)
Subdatos$Sub_metering_2 <- as.numeric(Subdatos$Sub_metering_2)
Subdatos$Sub_metering_3 <- as.numeric(Subdatos$Sub_metering_3)



png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(Subdatos, plot(Mergedatetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(Subdatos, plot(Mergedatetime, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(Subdatos, plot(Mergedatetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(Subdatos$Mergedatetime, Subdatos$Sub_metering_2,type="l", col= "red")
lines(Subdatos$Mergedatetime, Subdatos$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(Subdatos, plot(Mergedatetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()