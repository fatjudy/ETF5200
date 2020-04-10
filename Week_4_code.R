# Tutorial week 4 
# Week 4 Question 1

# Simmulate AR(p) processes

# AR(1): the coefficient of AR(1) should be in the range of (-1, 1)

ts1 <- arima.sim(model = list(order = c(1,0,0), ar = c(0.6)), n = 500)
plot(ts1, type = 'l')

# ar.ols
ar.ols(ts1, aic = TRUE)

# ar.yw
ar.yw(ts1)

# ar.mle
ar.mle(ts1)

# If you have questions, ask R for them!
?arima

# AR(3) model
# Generate an AR(3) model: be careful about the coefficient values:
ts2 = arima.sim(model = list(order = c(3,0,0), ar = c(0.6, 0.1, 0.2)), n = 500)
plot(ts2, type = 'l')

# Use ar.ols to estimate
ar.ols(ts2, order.max = 3)

# Use similar ways for yw and mle:
ar.yw(ts2)

ar.mle(ts2)

# arima function
# Generate an ARIMA(p,d,q)
ts3 = arima.sim(model = list(order = c(3,1,1), ar = c(0.6, 0.1, 0.2), ma = c(0.6)), n = 500)
plot(ts3, type = 'l')

arima(ts3)
arima(ts3, order = c(3,1,1))

# Tutorial 4 Q1 part 2
lh.arima <- arima(lh, order = c(3,0,3))
lh.arima

# Tutorial 5 Q1
ts1 <- arima.sim(200, model = list(order = c(1, 0, 1), ar = c(0.8), ma = c(0.6)))
ts2 <- arima.sim(200, model = list(order = c(2,0,0), ar = c(0.5, 0.4)))
plot(ts1)
plot(ts2)

# model estimation
model_1 = arima(ts1, order = c(1,0,1), include.mean = FALSE)
model_1

# predict() function to predict
ts1_fore = predict(model_1, n.ahead = 10)
# ts1_fore is a list, not a vector of value
# transform the list into values
pred_values = ts1_fore$pred
pred_values
plot(pred_values)

# append the predicted values to original ts1
total1 = append(ts1, pred_values)
length(total1)
plot(ts1)
plot(total1,type = 'l')


ts2 <- arima.sim(200, model = list(order = c(2,0,0), ar = c(0.5, 0.4)))
model_2 <- arima(ts2, order = c(2,0,0), include.mean = FALSE)
model_2

ts2_fore = predict(model_2, n.ahead = 10)
pred_values2 = ts2_fore$pred
plot(pred_values2)
total2 = append(ts2, pred_values2)
plot(ts2)
plot(total2, type='l')

# THe longer the prediction period is, not accurate as before

# R script, documentation of function we use


