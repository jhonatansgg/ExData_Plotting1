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



png("plot2.png",width = 480, height = 480)
with(Subdatos,plot(Mergedatetime,Global_active_power, type = "l",xlab="Day",
                   ylab="Global Active Power (kilowatts)"))
dev.off()