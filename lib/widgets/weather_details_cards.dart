import 'package:flutter/material.dart';
import 'package:ez_horizon_weather_app/models/weather_model.dart'; // Ensure this import is correct
import 'package:intl/intl.dart'; // Needed for date formatting
import 'package:ez_horizon_weather_app/constants.dart'; // Import the constants file

class WeatherDetailsCardsWidget extends StatelessWidget {
  final Weather? weather;

  const WeatherDetailsCardsWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    // Show loading state if weather data is null
    if (weather == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                customPrimaryColor, 
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 16),
          child: Text(
            'TODAY\'S DETAILS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: customPrimaryColor,
              letterSpacing: 1.5,
            ),
          ),
        ),

        // Primary details row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(
              context,
              Icons.water_drop_outlined,
              'Humidity',
              '${weather!.humidity}%',
              flex: 1,
            ),
            const SizedBox(width: 16),
            _buildDetailCard(
              context,
              Icons.air_outlined,
              'Wind',
              '${weather!.windSpeed.toStringAsFixed(1)} km/h',
              subtitle: _getWindDirection(weather!.windDirection),
              flex: 1,
            ),
          ],
        ),

        const SizedBox(height: 16),
        // Secondary details row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(
              context,
              Icons.visibility_outlined,
              'Visibility',
              '${(weather!.visibility / 1000).toStringAsFixed(1)} km',
              flex: 1,
            ),
            const SizedBox(width: 16),
            _buildDetailCard(
              context,
              Icons.speed_outlined,
              'Pressure',
              '${weather!.pressure} hPa',
              flex: 1,
            ),
          ],
        ),

        const SizedBox(height: 25),
        // Sun times container
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFB74D), // Light Orange
                Color(0xFFFB8C00), // Darker Orange
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withAlpha(62),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSunTimeColumn(
                context,
                Icons.wb_sunny_outlined,
                'Sunrise',
                _formatTime(weather!.sunrise),
              ),
              // Divider
              Container(
                height: 60,
                width: 1.5,
                color: Colors.white.withAlpha(60),
              ),
              _buildSunTimeColumn(
                context,
                Icons.nightlight_round_outlined,
                'Sunset',
                _formatTime(weather!.sunset),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper widget for individual detail cards
  Widget _buildDetailCard(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    String? subtitle,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(34),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 24,
              color: customPrimaryColor, // Use the constant
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Helper widget for sun time columns
  Widget _buildSunTimeColumn(
    BuildContext context,
    IconData icon,
    String label,
    String time,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Helper to get wind direction abbreviation
  String _getWindDirection(int degrees) {
    const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    int index = ((degrees % 360) / 45).round() % 8;
    return directions[index];
  }

  // Helper to format DateTime to time string (e.g., 9:00 AM)
  String _formatTime(DateTime time) {
    return DateFormat.jm().format(time);
  }
}
