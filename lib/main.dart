import 'package:ez_horizon_weather_app/screens/weather_screen.dart';
import 'package:ez_horizon_weather_app/services/city_data_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();

  // Preload cities data
  await CityDataCache().loadCities();

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
