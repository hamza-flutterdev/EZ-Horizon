import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ez_horizon_weather_app/models/weather_model.dart'; // Ensure this import is correct

class WeatherMainInfoWidget extends StatelessWidget {
  final Weather? weather;
  final String animationPath;

  const WeatherMainInfoWidget({
    super.key,
    required this.weather,
    required this.animationPath,
  });

  @override
  Widget build(BuildContext context) {
    // Show loading state if weather data is null
    if (weather == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            animationPath,
            width: 200,
            height: 200,
          ), 
          const SizedBox(height: 20),
          const Text(
            "Fetching data...", 
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        
        Hero(
          tag: 'city-name',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              weather!.cityName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20), 
        // Weather animation
        Hero(
          tag: 'weather-animation',
          child: Lottie.asset(
            animationPath,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 12), 
        // Temperature
        Hero(
          tag: 'temperature',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              '${weather!.temperature.round()}°C',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8), 
        // Weather condition
        Hero(
          tag: 'weather-condition',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              weather!.condition,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
      ],
    );
  }
}