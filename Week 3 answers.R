# Week 3

# Question 1 
# ARIMA(1,0,1)
ts1 = arima.sim(500,model = list(order = c(1,0,1), ar = c(0.8), ma = c(0.6)))
plot(ts1)
acf(ts1)

#ARIMA(1,0,0)
ts2=arima.sim(500, model=list(order=c(1,0,0),ar=c(0.8)))
acf(ts2)

#ARIMA(0,0,1)
ts3=arima.sim(500, model=list(order=c(0,0,1),ma=c(0.6)))
acf(ts3)


# Question 2
# ARIMA(1,1,1)
ts4 = arima.sim(500,model = list(order = c(1,1,1), ar = c(0.8), ma = c(0.6)))
acf(ts4)
diff_ts4 = diff(ts4)
acf(diff_ts4)

#ARIMA(1,1,0)
ts5=arima.sim(500, model=list(order=c(1,1,0),ar=c(0.8)))
acf(ts5)
ts5.diff=diff(ts5)
acf(ts5.diff)

# Question 3
# In R, we obtain the CO2 data by command co2.
co2
plot(co2)
acf(co2)

# Eliminate the trend by taking first difference
co2.diff1=diff(co2)
plot(co2.diff1)
acf(co2.diff1)

# To eliminate both trend and seasonality:
co2.diff2=diff(co2,lag=12,differences=1)
plot(co2.diff2)
acf(co2.diff2)

#Question 4
co2.dcp=stl(co2,s.window=4,t.window=50,t.jump=1)
plot(co2.dcp)
co2.dcp.values=co2.dcp$time.series
co2.season=co2.dcp.values[,1]
plot(co2.season)
co2.trend=co2.dcp.values[,2]
plot(co2.trend)
co2.adj=co2.dcp.values[,3]
plot(co2.adj)

# Question 5
nottem
plot(nottem)
acf(nottem)

# Eliminate the trend by taking first difference
nottem.diff1=diff(nottem)
plot(nottem.diff1)
acf(nottem.diff1)


# To eliminate both trend and seasonality:
nottem.diff2=diff(nottem,lag=12,differences=1)
plot(nottem.diff2)
acf(nottem.diff2)

# Import data from xls into R
# Download the xls file from website
# Put the xls file into your R directory
# Read xls/xlsx

install.packages("readxl")  # package to read xls/xlsx file
library(readxl)  # Use the package
gdp_raw <- read_xls("KNI.xls",range = "Data1!A11:B70")  # range: "Sheet_name ! table_range"
gdp_data <- data.frame(gdp_data) # dataframe format is easier to handel in R

year = gdp_data[,1] # Choose the first column of gdp_data
gdp = gdp_data[,2]  # Choose the second column of gdp_data
plot(year,gdp,type = "l", main = "GDP of Australia", xlab = "Year", ylab = "GDP", col = "blue") 



