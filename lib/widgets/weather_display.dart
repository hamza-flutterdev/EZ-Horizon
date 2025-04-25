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
    return PullToRefresh(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Location and main weather info
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
    );
  }
}
