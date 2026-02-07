import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_remake/pages/get_started.dart';
import 'package:weather_app_remake/provider/weather_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: const GetStarted(),
      ),
    );
  }
}
