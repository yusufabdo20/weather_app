import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home/homeScreen.dart';
import 'package:weather_app/pages/search/searchScreen.dart';
import 'package:weather_app/providers/weatherProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).weatherData == null
                  ? Colors.grey
                  : Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()),
      home: HomeScreen(),
    );
  }
}
