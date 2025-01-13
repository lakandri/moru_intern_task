import 'package:moru_internship/domain/entities/entities.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeatherByLocation(String location);
}
