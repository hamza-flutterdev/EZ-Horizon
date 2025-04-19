// weather display UI

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ez_horizon_weather_app/models/weather_model.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather? weather;
  final String animationPath;

  const WeatherDisplay({
    super.key,
    required this.weather,
    required this.animationPath,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Weather information
            Hero(
              tag: 'city-name',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  weather?.cityName ?? "Loading City",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Hero(
              tag: 'weather-animation',
              child: Lottie.asset(
                animationPath,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Hero(
              tag: 'temperature',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  '${weather?.temperature.round()}°C',
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Hero(
              tag: 'weather-condition',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  weather?.condition ?? '',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}