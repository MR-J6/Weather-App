import 'package:flutter/material.dart';
import 'package:weather_app_remake/components/card_view.dart';

class WeatherBodyPage extends StatelessWidget {
  const WeatherBodyPage({
    super.key,
    required this.date,
    required this.temp,
    required this.cloud,
    required this.wind,
    required this.humidity,
    required this.code,
    required this.isDay,
  });

  final String date;
  final double temp;
  final int cloud;
  final double wind;
  final int humidity;
  final int code;
  final bool isDay;

  String getWeatherImage(int code) {
    switch (code) {
      case 1000:
        return 'assets/images/sunny.png';
      case 1003:
      case 1006:
      case 1009:
        return 'assets/images/cloudy.png';
      case 1183:
      case 1189:
        return 'assets/images/rain.png';
      case 1210:
      case 1213:
        return 'assets/images/snowy.png';
      case 1087:
      case 1273:
      case 1276:
      case 1279:
      case 1282:
        return 'assets/images/storm.png';
      default:
        return 'assets/images/sunny.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'About Today',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(70),
                blurRadius: 15,
                spreadRadius: 20,
                offset: Offset(0.0, 0.0),
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Image.asset(
            getWeatherImage(code),
            height: 200,
            width: 200,
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text('Updated at : ${date.split(' ').last}'),
        ),
        Text(
          '$temp°',
          style: TextStyle(fontSize: 41, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardView(num: '$cloud%', labelName: 'Cloud', isDay: isDay, imagePath: 'assets/icons/cloud.png',),
            CardView(num: '$wind Km/h', labelName: 'Wind', isDay: isDay, imagePath: 'assets/icons/wind.png',),
            CardView(num: '$humidity%', labelName: 'Humidity', isDay: isDay, imagePath: 'assets/icons/humidity.png',),
          ],
        ),
      ],
    );
  }
}
