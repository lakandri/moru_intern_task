import '../entities/entities.dart';
import '../repo/weather_repository.dart';

class GetWeatherByLocation {
  final WeatherRepository repository;

  GetWeatherByLocation(this.repository);

  Future<WeatherEntity> execute(String location) {
    return repository.getWeatherByLocation(location);
  }
}
