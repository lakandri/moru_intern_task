import 'package:flutter/material.dart';
import 'package:moru_internship/constant/const.dart';
import 'package:moru_internship/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF87CEEB), Color(0xFF4682B4)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.02,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: size.width * 0.07,
                      ),
                      // iconSize: 10,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashScreen(),
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: size.width * 0.07,
                        ),
                        Text(
                          weatherProvider.weather?.locationName ??
                              'Fetching...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: size.width * 0.06,
                      backgroundImage: const AssetImage('assets/man.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (weatherProvider.isLoading)
                  const CircularProgressIndicator()
                else if (weatherProvider.errorMessage.isNotEmpty)
                  Text(
                    weatherProvider.errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: size.width * 0.04,
                    ),
                  )
                else if (weatherProvider.weather != null)
                  Column(
                    children: [
                      Icon(
                        Icons.cloud,
                        size: size.width * 0.25,
                        color: textColor,
                      ),
                      Text(
                        '${weatherProvider.weather!.temperature}°',
                        style: TextStyle(
                          fontSize: size.width * 0.2,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        weatherProvider.weather!.condition,
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        'Wind: ${weatherProvider.weather!.windSpeed} km/h | '
                        'Humidity: ${weatherProvider.weather!.humidity}% | '
                        'Precipitation: ${weatherProvider.weather!.precipitation}%',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: size.width * 0.04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                const Spacer(),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'Search city',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.015,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: size.width * 0.06,
                      ),
                      onPressed: () {
                        weatherProvider
                            .fetchWeather(_locationController.text.trim());
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
