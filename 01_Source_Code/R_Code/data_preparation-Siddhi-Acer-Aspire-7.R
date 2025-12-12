
# Load libraries
library(dplyr)
library(ggplot2)
library(forecast)
library(tseries)
library(keras)
library(tensorflow)
library(forecast)
ls("package:forecast")




# Load the dataset
temp_data <- read.csv("US_City_Temp_Data.csv")
#str(temp_data)

# Convert the `time` column to Date format
temp_data$time <- as.Date(temp_data$time, format = "%Y-%m-%d")


# Explore the data
str(temp_data)
summary(temp_data)


# Select data for Albuquerque
city_data <- temp_data %>% select(time, albuquerque) %>% na.omit()

# Convert to time series
city_ts <- ts(city_data$albuquerque, start = c(1948, 1), frequency = 12)

# Plot the time series
plot(city_ts, main = "Monthly Temperature for Albuquerque", ylab = "Temperature (°C)", xlab = "Time")

#Visualize Temperature Over Time
ggplot(city_data, aes(x = time, y = albuquerque)) +
  geom_line() +
  labs(title = "Temperature Over Time - Albuquerque", x = "Date", y = "Temperature (°C)")

#Seasonality and Trend Analysis
decomposed <- decompose(city_ts)
plot(decomposed)

#Stationarity Check:
adf.test(city_ts)


#ARIMA Model Implementation

#Stationarize the Data 
city_ts_diff <- diff(city_ts, differences = 1)
adf.test(city_ts_diff)

#Fit the ARIMA Model:
arima_model <- auto.arima(city_ts)
summary(arima_model)

#Forecast with ARIMA:
arima_forecast <- forecast(arima_model, h = 12)
plot(arima_forecast)

#LSTM Model Implementation

#Scale the Data: LSTM models often require scaled data
scaled_data <- scale(city_data$albuquerque)

#Reshape Data for LSTM:
#Convert data into a 3D array (samples, timesteps, features) format.

X_train <- array(scaled_data, dim = c(length(scaled_data), 1, 1))
Y_train <- scaled_data

#Define the LSTM Model:
model <- keras_model_sequential() %>%
  layer_lstm(units = 50, input_shape = c(1, 1), return_sequences = TRUE) %>%
  layer_lstm(units = 50, return_sequences = FALSE) %>%
  layer_dense(units = 1)

#Compile and Train the Model:
model %>% compile(
  optimizer = 'adam',
  loss = 'mean_squared_error'
)
history <- model %>% fit(
  X_train, Y_train,
  epochs = 50, batch_size = 32,
  validation_split = 0.2
)

#Make Predictions with LSTM
lstm_predictions <- model %>% predict(X_train)

#Model Evaluation


#ARIMA Model Evaluation:
#Use standard evaluation metrics such as RMSE and MAE.

arima_accuracy <- accuracy(arima_forecast)
print(arima_accuracy)

#LSTM Model Evaluation:
#Convert predictions back to the original scale and calculate RMSE and MAE.

unscaled_predictions <- lstm_predictions * attr(scaled_data, "scaled:scale") + attr(scaled_data, "scaled:center")
rmse_lstm <- rmse(city_data$albuquerque, unscaled_predictions)
print(paste("LSTM RMSE:", rmse_lstm))

#Hybrid Model (Optional):
#Combine ARIMA and LSTM predictions, for example by averaging.

hybrid_predictions <- (arima_forecast$mean + unscaled_predictions) / 2
rmse_hybrid <- rmse(city_data$albuquerque, hybrid_predictions)
print(paste("Hybrid RMSE:", rmse_hybrid))


#Visualization of Results
#Plot Actual vs Predicted Temperatures:

plot(city_ts, main = "Temperature Forecast Comparison")
lines(arima_forecast$mean, col = "blue", lty = 2)
lines(unscaled_predictions, col = "red", lty = 2)
lines(hybrid_predictions, col = "green", lty = 2)


#Comparison of Model Performance:
legend("topright", legend = c("Actual", "ARIMA", "LSTM", "Hybrid"), col = c("black", "blue", "red", "green"), lty = 1:2)





