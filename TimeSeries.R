#library
#install
install.packages("forecast")
#load
library(forecast)
#load the data(Daily_Climate.csv)
dc<-read.csv("C:\\Users\\15878\\OneDrive\\Desktop\\data420\\Daily_Climate.csv")
summary(dc)

#convert Date column to a proper date format
dc$date <- as.Date(dc$date)

#create time series objects
dc_ts<- ts(
  dc$meantemp,#select the column to perform the time series
  start = min(dc$date),#selecting the column to perform the time series
  frequency = 365)#daily frequency (365 observations per year)


#explore the time series
summary(dc_ts)
head(dc_ts)
#plot time series
plot(dc_ts, #the time series to plot
     main = 'Daily Climate Date',
     ylab = 'Temperature'
     
     )
#time series decompostion
#decompose time series to its consistuent components
#typically trends, seasonal and remainder components
decomp_ts <- decompose(dc_ts)

plot(decomp_ts)
#time series forecasting
forecast_ts<-forecast(auto.arima(dc_ts))
#plot(forecast_ts)
plot(forecast_ts)
#perform correlation plotting
acf(dc_ts)
#perform partial correlation plot
pacf(dc_ts)

#perform cross correlation plot
#measure the similarity between two time series
ccf(dc_ts,
    dc_ts,
    main = 'Cross_Correlation of temperature') #plot title
