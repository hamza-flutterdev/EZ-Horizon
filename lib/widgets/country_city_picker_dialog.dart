import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class CountryCityPickerDialog extends StatelessWidget {
  final Function(String) onCitySelected;

  const CountryCityPickerDialog({super.key, required this.onCitySelected});

  @override
  Widget build(BuildContext context) {
    // Calculate screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Adjust dialog width to prevent horizontal overflow
    // Making it slightly narrower than 90% of screen width
    final double dialogWidth = screenWidth * 0.85;

    return Dialog(
      //backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // Remove inset padding that might cause additional overflow
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.1,
      ),
      child: Container(
        width: dialogWidth,
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.7,
          maxWidth: dialogWidth,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF4A90E2), // Top blue
              Color(0xFF5F9CE3), // Middle blue
              Color(0xFF74A8E4), // Bottom blue
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Select Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SelectState(
                    onCountryChanged: (value) {},
                    onStateChanged: (value) {},
                    onCityChanged: (value) {
                      if (value.isNotEmpty) {
                        onCitySelected(value);
                        Navigator.pop(context);
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: Color(0xFF4A90E2),
                  ),

                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A90E2),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
