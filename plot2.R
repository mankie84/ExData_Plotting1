oldwd <- getwd()

if (file.exists("exdata-data-household_power_consumption")){				## check if specdata is there
		setwd("exdata-data-household_power_consumption")				## set new wd
}		else {
		writeLines("Please move the 'exdata-data-household_power_consumption' folder to the current working directory! \nThen run again. Thx")
		stop()
}

dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings="?")
dat$newDate <- as.Date(dat$Date,"%d/%m/%Y")
dat$date_time <- as.POSIXct(paste(dat$newDate, dat$Time), format="%Y-%m-%d %H:%M:%S")
mydat <- dat[dat$newDate %in% as.Date(c('2007-02-01', '2007-02-02')),]

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(mydat$date_time,mydat$Global_active_power, ylab="Global Active Power (kilowatts)", pch="",lines(mydat$date_time, mydat$Global_active_power),xlab="")
dev.off()
setwd(oldwd)