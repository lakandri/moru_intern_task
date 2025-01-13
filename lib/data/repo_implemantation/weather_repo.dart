import '../datammodels/weather_tempertaure.dart';
import '../datasource/weather_data_source.dart';

class WeatherRepositoryImpl {
  final WeatherApiService apiService;

  WeatherRepositoryImpl({required this.apiService});

  Future<WeatherModel> getWeather(String location) async {
    final data = await apiService.fetchWeather(location);
    return WeatherModel.fromJson(data);
  }
}
