class WeatherEntity {
  final String location;
  final double temperature;
  final String condition;
  final double windSpeed;
  final double humidity;
  final double rainChance;

  WeatherEntity({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.windSpeed,
    required this.humidity,
    required this.rainChance,
  });
}
