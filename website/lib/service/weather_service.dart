import 'package:website/model/weather_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService{

  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  String apiKey = 'ca8fbbacbba4360a1acc35c558f693f0';

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    print('$BASE_URL?q=$cityName&appid=$apiKey&units=metric');

    if (response.statusCode == 200){
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}