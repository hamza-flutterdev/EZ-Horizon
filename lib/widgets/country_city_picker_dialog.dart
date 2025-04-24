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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Select Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  // Pass the width constraint to ensure SelectState respects boundaries
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      width: constraints.maxWidth,
                      // Force the SelectState to fit within our width constraints
                      child: SelectState(
                        onCountryChanged: (value) {},
                        onStateChanged: (value) {},
                        onCityChanged: (value) {
                          if (value.isNotEmpty) {
                            onCitySelected(value);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
