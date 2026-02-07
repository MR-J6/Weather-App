import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_remake/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'd9b32bbaab55478ab3123828262401';

  Future<WeatherModel> getWeather({required String country}) async {
    Uri url = Uri.parse(
      '$baseUrl/current.json?key=$apiKey&q=$country&days=1&aqi=no&alerts=no',
    );

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
