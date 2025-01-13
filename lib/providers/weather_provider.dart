import 'package:flutter/material.dart';

import '../data/datammodels/weather_tempertaure.dart';
import '../data/repo_implemantation/weather_repo.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherRepositoryImpl repository;

  WeatherModel? _weather;
  bool _isLoading = false;
  String _errorMessage = '';

  WeatherProvider({required this.repository});

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchWeather(String location) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final data = await repository.getWeather(location);
      _weather = data;
    } catch (e) {
      _errorMessage = 'Failed to fetch weather data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
