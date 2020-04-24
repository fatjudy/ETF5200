# Download CPI data 
# Import US CPI data to R

CPI_data <- readxl::read_xls("CPIAUCSL.xls", skip = 10) # Because the first 10 rows are discriptions

# Plot the data
plot(CPI_data$observation_date, CPI_data$CPIAUCSL, type = 'l', main = "US CPI Monthly Data", xlab = "Year", ylab = "CPI")

# Create log and 1st difference for CPI
# Transform the CPI into a time series using function ts()
cpi = ts(CPI_data$CPIAUCSL, start = c(1947, 1), frequency = 12) # start from 1947, 1

# Taking log: log() function
lcpi = log(cpi)
plot(lcpi, main = "Log of CPI", xlab = "Year", ylab = "Log of CPI")

# Take the first difference: diff() function
# Take 1st difference on lcpi
dlcpi = diff(lcpi)
plot(dlcpi, main = "Inflation", xlab = "Year", ylab = "Inflation")

# Check the ACF plot using acf()
acf_lcpi = acf(lcpi, lag.max = 10, type = "correlation")
?acf # Check details of a function by using "?function name"

acf(dlcpi) # More stationary?

# We cannot say stationary or not by checking ACF
# Stationary tests
# Package:tseries
install.packages("tseries") # first way
# Second way:Tool - install packages - type name of package - click install

library(tseries)

# ADF test: adf.test()
adf.test(lcpi)

# pp test: pp.test()
pp.test(lcpi)

# lcpi not stationary

# KPSS test: kpss.test()
kpss.test(lcpi, null = "Trend")


# Variance ratio test: not included in our "tseries"
install.packages("vrtest")

library(vrtest)

# Variance Ratio test: Auto.VR()
Auto.VR(lcpi)





















