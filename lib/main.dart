import 'package:flutter/material.dart';
import 'package:moru_internship/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'data/datasource/weather_data_source.dart';
import 'data/repo_implemantation/weather_repo.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(
            repository: WeatherRepositoryImpl(
              apiService: WeatherApiService(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashScreen(),
      ),
    );
  }
}
