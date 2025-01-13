import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApiService {
  final String apiKey = 'c9d98e330db866a0e9462d5b4351101c';

  Future<Map<String, dynamic>> fetchWeather(String location) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric';
    print('Fetching weather for: $location');
    print('API URL: $url');

    final response = await http.get(Uri.parse(url));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
