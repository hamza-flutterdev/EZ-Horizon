import 'package:ez_horizon_weather_app/screens/weather_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EZHorizon());
}

class EZHorizon extends StatelessWidget {
  const EZHorizon({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}
