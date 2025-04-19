// country, state and city selector

import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class CountryCityPickerDialog extends StatelessWidget {
  final Function(String) onCitySelected;

  const CountryCityPickerDialog({
    super.key,
    required this.onCitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Location',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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