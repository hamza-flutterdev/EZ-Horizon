// this file contains the code for search by name option

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CitySearchDialog extends StatefulWidget {
  final Function(String) onCitySelected;

  const CitySearchDialog({super.key, required this.onCitySelected});

  @override
  State<CitySearchDialog> createState() => _CitySearchDialogState();
}

class _CitySearchDialogState extends State<CitySearchDialog> {
  final TextEditingController _typeAheadController = TextEditingController();
  List<String> _allCities = [];

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'lib/assets/cities.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);
      setState(() {
        _allCities = jsonData.cast<String>();
      });
    } catch (e) {
      debugPrint('Error loading cities: $e');
    }
  }

  @override
  void dispose() {
    _typeAheadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: const Color(0xFF4A90E2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        content: TypeAheadField<String>(
          hideOnLoading: true,
          debounceDuration: const Duration(milliseconds: 300),
          controller: _typeAheadController,
          suggestionsCallback: (pattern) async {
            if (pattern.length < 2) return [];
            return _allCities
                .where(
                  (city) => city.toLowerCase().contains(pattern.toLowerCase()),
                )
                .take(10)
                .toList();
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(
                suggestion,
                style: const TextStyle(color: Colors.white),
              ),
              tileColor: Color(0xFF5F9CE3),
            );
          },
          onSelected: (suggestion) {
            _typeAheadController.text = suggestion;
            widget.onCitySelected(suggestion);
            Navigator.pop(context);
            _typeAheadController.clear();
          },
          decorationBuilder: (context, child) {
            return Material(
              color: const Color(0xFF5F9CE3),
              borderRadius: BorderRadius.circular(8),
              child: child,
            );
          },
          builder: (context, controller, focusNode) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type Here',
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withAlpha(25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black87, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
            );
          },
          loadingBuilder:
              (context) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: CircularProgressIndicator(color: Colors.white),
              ),
          errorBuilder:
              (context, error) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Text(
                  'Error occurred',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          emptyBuilder:
              (context) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Text(
                  'No cities found',
                  style: TextStyle(color: Colors.white),
                ),
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(foregroundColor: Colors.white70),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_typeAheadController.text.isNotEmpty) {
                widget.onCitySelected(_typeAheadController.text);
                Navigator.pop(context);
                _typeAheadController.clear();
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white.withAlpha(50),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
