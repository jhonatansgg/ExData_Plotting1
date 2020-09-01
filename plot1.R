getwd()
setwd("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R4\\Week 1\\Final")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "Data.zip", method = "curl")
list.files("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R4\\Week 1\\Final")
fecha <- date()
fecha
unzip("Data.zip")

#Leer datos
Datos <- read.table("household_power_consumption.txt", sep = ";",skip = 1)
names(Datos) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Podria ser asi: Subdatos <- subset(Datos,Datos$Date == "1/2/2007" | power$Date =="2/2/2007")
Subdatos <- Datos[Datos$Date %in% c("1/2/2007","2/2/2007"),]

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

png("plot1.png",width = 480, height = 480)
hist(Subdatos$Global_active_power,col = "red", border = "black", main = "Global Active Power", 
     xlab = "Global Active Power[Kilowatts]", ylab = "Frequency")
dev.off()
 