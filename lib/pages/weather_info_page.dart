import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_remake/components/weather_body_page.dart';
import 'package:weather_app_remake/components/weather_top_page.dart';
import 'package:weather_app_remake/models/weather_model.dart';
import 'package:weather_app_remake/provider/weather_provider.dart';
import 'package:weather_app_remake/services/weather_service.dart';

class WeatherInfoPage extends StatefulWidget {
  final String countryName;
  const WeatherInfoPage({super.key, required this.countryName});

  @override
  State<WeatherInfoPage> createState() => _WeatherInfoPageState();
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    WeatherModel weather = await weatherService.getWeather(country: widget.countryName);
    Provider.of<WeatherProvider>(context, listen: false).setWeatherData(weather);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        bool isDay = false;
        if (weatherProvider.weatherData != null) {
          int hour = DateTime.parse(weatherProvider.weatherData!.date).hour;
          isDay = hour >= 6 && hour < 18;
        }
        return Scaffold(
          backgroundColor: weatherProvider.weatherData != null && isDay ? Colors.blueAccent : Color(0xff05082e),
          body: Column(
            children: [
              WeatherTopPage(name: widget.countryName),
              if (weatherProvider.weatherData != null)
                WeatherBodyPage(
                  date: weatherProvider.weatherData!.date,
                  temp: weatherProvider.weatherData!.temp,
                  cloud: weatherProvider.weatherData!.cloud,
                  wind: weatherProvider.weatherData!.wind,
                  humidity: weatherProvider.weatherData!.humidity,
                  code: weatherProvider.weatherData!.code,
                  isDay: isDay,
                )
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
