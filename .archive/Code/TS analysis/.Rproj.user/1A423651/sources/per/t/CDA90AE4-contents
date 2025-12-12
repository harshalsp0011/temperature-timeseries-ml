
# Load libraries
library(dplyr)
library(ggplot2)
library(forecast)
library(tseries)
library(keras3)
library(tensorflow)
library(forecast)
library(Metrics)
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

ggplot(city_data, aes(x = time, y = albuquerque)) +
  geom_line() +
  labs(title = "Temperature Over Time - Albuquerque", x = "Date", y = "Temperature (°C)")

decomposed <- decompose(city_ts)
plot(decomposed)


# Stationarity Check
adf.test(city_ts)


#ARIMA Model Implementation

city_ts_diff <- diff(city_ts, differences = 1)
adf.test(city_ts_diff)

arima_model <- auto.arima(city_ts)
summary(arima_model)

arima_forecast <- forecast(arima_model, h = 12)
plot(arima_forecast)

#LSTM Model Implementation
# Load reticulate and use the specified virtual environment

library(reticulate)
use_virtualenv("C:/Users/harsh/OneDrive/Documents/.virtualenvs/r-reticulate", required = TRUE)
library(keras)
library(tensorflow)
# install_tensorflow(version = "2.16.1")  # Use the latest stable version

# Scale the data
scaled_data <- scale(city_data$albuquerque)

# Create sequences for LSTM
create_sequences <- function(data, look_back = 12) {
  n <- length(data)
  x <- matrix(0, nrow = n - look_back, ncol = look_back)
  y <- vector("numeric", n - look_back)
  
  for(i in 1:(n - look_back)) {
    x[i,] <- data[i:(i + look_back - 1)]
    y[i] <- data[i + look_back]
  }
  list(x = array(x, dim = c(nrow(x), look_back, 1)), y = y)
}

# Prepare sequences
sequences <- create_sequences(scaled_data)

# Define LSTM model
model <- keras_model_sequential() %>%
  layer_lstm(units = 50, input_shape = c(12, 1)) %>%
  layer_dropout(0.2) %>%
  layer_dense(units = 1)

# Compile model
model %>% compile(
  optimizer = optimizer_adam(learning_rate = 0.001),
  loss = "mse"
)
history <- lstm_model %>% fit(
  X_train, Y_train,
  epochs = 50, batch_size = 32,
  validation_split = 0.2
)

# Make Predictions with LSTM
lstm_predictions <- lstm_model %>% predict(X_train)


# Check if TensorFlow is available
#if (!py_module_available("tensorflow")) {
  # Install TensorFlow in the specified virtual environment
  #install_tensorflow(method = "virtualenv", envname = "C:/Users/harsh/OneDrive/Documents/.virtualenvs/r-reticulate")
# }

# Scaling data and reshaping for LSTM
# scaled_data <- scale(city_data$albuquerque)
# X_train <- array(scaled_data, dim = c(length(scaled_data), 1, 1))
# Y_train <- scaled_data

# Define the model
# model <- keras_model_sequential() %>%
#   layer_lstm(units = 50, return_sequences = TRUE, input_shape = c(1, 1)) %>%
#   layer_lstm(units = 50, return_sequences = FALSE) %>%
#   layer_dense(units = 1)

# Compile the model
# model %>% compile(
#   optimizer = "adam",
#   loss = "mean_squared_error"
# )


# Print model summary
# summary(model)
# # Fit the model
# history <- model %>% fit(
#   X_train, Y_train,
#   epochs = 50, 
#   batch_size = 32,
#   validation_split = 0.2
# )
# 
# lstm_predictions <- model %>% predict(X_train)

#Model Evaluation

arima_accuracy <- accuracy(arima_forecast)
print(arima_accuracy)


unscaled_predictions <- lstm_predictions * attr(scaled_data, "scaled:scale") + attr(scaled_data, "scaled:center")
rmse_lstm <- rmse(city_data$albuquerque, unscaled_predictions)
print(paste("LSTM RMSE:", rmse_lstm))


hybrid_predictions <- (arima_forecast$mean + unscaled_predictions) / 2
rmse_hybrid <- rmse(city_data$albuquerque, hybrid_predictions)
print(paste("Hybrid RMSE:", rmse_hybrid))

#Visualization of Results

plot(city_ts, main = "Temperature Forecast Comparison")
lines(arima_forecast$mean, col = "blue", lty = 2)
lines(unscaled_predictions, col = "red", lty = 2)
lines(hybrid_predictions, col = "green", lty = 2)


#Comparison of Model Performance:
legend("topright", legend = c("Actual", "ARIMA", "LSTM", "Hybrid"), col = c("black", "blue", "red", "green"), lty = 1:2)





