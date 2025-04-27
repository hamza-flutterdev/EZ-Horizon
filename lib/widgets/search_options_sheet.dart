// search options sheet

import 'package:flutter/material.dart';
import 'build_list_tile.dart';

class SearchOptionsSheet extends StatelessWidget {
  final VoidCallback onCurrentLocationSelected;
  final VoidCallback onCountryCitySelected;
  final VoidCallback onCitySearchSelected;

  const SearchOptionsSheet({
    super.key,
    required this.onCurrentLocationSelected,
    required this.onCountryCitySelected,
    required this.onCitySearchSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(135),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              BuildListTile(
                icon: Icons.my_location,
                title: 'Current Location',
                onTap: () {
                  Navigator.pop(context);
                  onCurrentLocationSelected();
                },
              ),

              const Divider(color: Colors.white24),
              BuildListTile(
                icon: Icons.flag,
                title: 'Select Country & City',
                onTap: () {
                  Navigator.pop(context);
                  onCountryCitySelected();
                },
              ),

              const Divider(color: Colors.white24),
              BuildListTile(
                icon: Icons.search,
                title: 'Search by Name',
                onTap: () {
                  Navigator.pop(context);
                  onCitySearchSelected();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
