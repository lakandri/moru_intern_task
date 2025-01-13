import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  final double tempC;
  final String conditionText;
  final String iconUrl;

  const TemperatureWidget({
    required this.tempC,
    required this.conditionText,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$tempC°C', style: const TextStyle(fontSize: 32)),
        Text(conditionText, style: const TextStyle(fontSize: 18)),
        Image.network(iconUrl),
      ],
    );
  }
}
