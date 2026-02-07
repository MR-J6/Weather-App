import 'package:flutter/material.dart';
import 'package:weather_app_remake/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherData;

  void setWeatherData(WeatherModel data) {
    weatherData = data;
    notifyListeners();
  }
}
