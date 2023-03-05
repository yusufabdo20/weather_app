import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    WeatherModelError? weatherError;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = '79ad371c70cb41e4a05103055232302';
      Uri apiUrl =
          Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
      http.Response response = await http.get(apiUrl);
      Map<String, dynamic> data = jsonDecode(response.body);
     weather = WeatherModel.fromJson(data);
      // if(data = jsonDecode(response.body)["error"]) {
      //   data = jsonDecode(response.body)["error"]; 
      //   weatherError = WeatherModelError.fromJson(data);
      // }
      // else{
      // weather = WeatherModel.fromJson(data);}
    } catch (e) {
      print(e.toString());
    }
    return weather;
  }
}
