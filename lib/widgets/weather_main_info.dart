import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ez_horizon_weather_app/models/weather_model.dart';

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
    // Loading state if weather data is null
    if (weather == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(animationPath, width: 200, height: 200),
          const SizedBox(height: 20),
          const Text(
            "Fetching data...",
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white70,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        // City name
        Hero(
          tag: 'city-name',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              weather!.cityName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Weather animation
        Hero(
          tag: 'weather-animation',
          child: Lottie.asset(
            animationPath,
            width: 180,
            height: 180,
            fit: BoxFit.contain,
          ),
        ),

        // Temperature display
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main temperature number
            Hero(
              tag: 'temperature',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  '${weather!.temperature.round()}',
                  style: const TextStyle(
                    fontSize: 110,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // °C symbol
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '°C',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 70), // Push symbol to the top
              ],
            ),
          ],
        ),

        // Weather condition
        Hero(
          tag: 'weather-condition',
          child: Material(
            type: MaterialType.transparency,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weather!.condition,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
