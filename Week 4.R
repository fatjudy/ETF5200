#vinstall.packages(tseries)
#vlibrary(tseries)
# For AR(p) process, if p = 1, we need to chosse an AR coefficent within (-1,1);
# If p > 1, we need to be careful in choosing AR coefficients. (We need to satisfy the stationary condition)

# T4 (1)
# ar.ols, ar.yw, ar.mle: fit AR models to time series
# Generate an AR(1) model:
ts1 = arima.sim(model = list(order = c(1,0,0), ar = c(0.6)), n = 500)
plot(ts1)
ar.ols(ts1, aic = TRUE)

#Use ar.yw to estamte the coefficients
ar.yw(ts1)

#Use ar.mle to estamte the coefficients
ar.mle(ts1)


# Generate an AR(p) model:
ts2 = arima.sim(model = list(order = c(3,0,0), ar = c(0.6,0.1,0.2)), n = 500)
plot(ts2)

#Use ar.ols to estamte the coefficients
ar.ols(ts2, aic = TRUE)
ar.ols(ts2, order.max = 3)

#Use ar.yw to estamte the coefficients
ar.yw(ts2)

#Use ar.mle to estamte the coefficients
ar.mle(ts2)

# Generate an arima(3,1,1) model:
ts3 = arima.sim(500,model = list(order = c(3,1,1), ar = c(0.6, 0.1, 0.2), ma = c(0.6)))
arima(ts3, order = c(3,1,1))
# ?arima


# T4 (2)
lh.arima <- arima(lh, order = c(3,0,3))
lh.arima


# T5 (1)
# Generate two ARIMA processes
ts1 <- arima.sim(200,model = list(order = c(1, 0 ,1), ar = c(0.8), ma = c(0.6)))
ts2 <- arima.sim(200,model = list(order = c(2,0,0), ar = c(0.5, 0.4)))
plot(ts1)
plot(ts2)

# Model estimation
model_1 = arima(ts1, order = c(1,0,1), include.mean = FALSE)
model_1
ts1_fore = predict (model_1, n.ahead = 10)
ts1_fore
pred_values = ts1_fore$pred
plot(pred_values)

total1 = append(ts1, pred_values)
plot(ts1, type = 'l')
plot(total1, type = 'l')

