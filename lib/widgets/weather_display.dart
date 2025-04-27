import 'package:ez_horizon_weather_app/widgets/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:ez_horizon_weather_app/models/weather_model.dart';
import 'package:ez_horizon_weather_app/widgets/weather_main_info.dart';
import 'package:ez_horizon_weather_app/widgets/weather_details_cards.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather? weather;
  final String animationPath;
  final Future<void> Function()? onRefresh;

  const WeatherDisplay({
    super.key,
    required this.weather,
    required this.animationPath,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    // Use a Container with gradient background to match the screenshot
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4A90E2), // Top blue
            Color(0xFF5F9CE3), // Middle blue
            Color(0xFF74A8E4), // Bottom blue
          ],
        ),
      ),
      child: PullToRefresh(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Location and main weather info with Lottie animation
                WeatherMainInfoWidget(
                  weather: weather,
                  animationPath: animationPath,
                ),

                const SizedBox(height: 40),

                // Weather details cards
                WeatherDetailsCardsWidget(weather: weather),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
