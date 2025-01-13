class WeatherModel {
  final String locationName;
  final String condition;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final int precipitation;

  WeatherModel({
    required this.locationName,
    required this.condition,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.precipitation,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationName: json['name'] ?? 'Unknown',
      condition: (json['weather'] != null && json['weather'].isNotEmpty)
          ? json['weather'][0]['description'] ?? 'N/A'
          : 'N/A',
      temperature: json['main']?['temp']?.toDouble() ?? 0.0,
      windSpeed: json['wind']?['speed']?.toDouble() ?? 0.0,
      humidity: json['main']?['humidity'] ?? 0,
      precipitation: json['rain']?['1h']?.toInt() ?? 0,
    );
  }
}
