import 'package:flutter/material.dart';
import 'package:ez_horizon_weather_app/models/weather_model.dart';
import 'package:intl/intl.dart';

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
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        _buildSectionHeader('TODAY\'S DETAILS'),
        const SizedBox(height: 12),

        // First row
        Row(
          children: [
            // Humidity card
            Expanded(
              child: _buildDetailCard(
                title: 'Humidity',
                value: '${weather!.humidity}%',
                icon: Icons.water_drop_outlined,
              ),
            ),
            const SizedBox(width: 16),
            // Wind card
            Expanded(
              child: _buildDetailCard(
                title: 'Wind',
                value: '${weather!.windSpeed.toStringAsFixed(1)} km/h',
                subtitle: _getWindDirection(weather!.windDirection),
                icon: Icons.air_outlined,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Second row
        Row(
          children: [
            // Visibility card
            Expanded(
              child: _buildDetailCard(
                title: 'Visibility',
                value: '${(weather!.visibility / 1000).toStringAsFixed(1)} km',
                icon: Icons.visibility_outlined,
              ),
            ),
            const SizedBox(width: 16),
            // Pressure card
            Expanded(
              child: _buildDetailCard(
                title: 'Pressure',
                value: '${weather!.pressure} hPa',
                icon: Icons.speed_outlined,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        _buildSectionHeader('SUN TIMES'),
        const SizedBox(height: 12),

        // Sun times container
        Row(
          children: [
            _buildSunCard(
              icon: Icons.wb_sunny_outlined,
              title: 'Sunrise',
              time: _formatTime(weather!.sunrise),
            ),
            const SizedBox(width: 16),
            _buildSunCard(
              icon: Icons.nightlight_round_outlined,
              title: 'Sunset',
              time: _formatTime(weather!.sunset),
            ),
          ],
        ),
      ],
    );
  }

  // Detail card with translucent background
  Widget _buildDetailCard({
    required String title,
    required String value,
    required IconData icon,
    String? subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withAlpha(150),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle != null
              ? Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withAlpha(135),
                  fontWeight: FontWeight.w500,
                ),
              )
              : const SizedBox(height: 16), // Reserve space if no subtitle
        ],
      ),
    );
  }

  // Sun card with translucent background
  Widget _buildSunCard({
    required IconData icon,
    required String title,
    required String time,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(35),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withAlpha(150),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Section header for themed version
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
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
