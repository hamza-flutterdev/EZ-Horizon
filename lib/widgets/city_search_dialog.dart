// this file contains the code for search by name option

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CitySearchDialog extends StatefulWidget {
  final Function(String) onCitySelected;

  const CitySearchDialog({
    super.key,
    required this.onCitySelected,
  });

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
    return AlertDialog(
      title: const Text('Search City'),
      content: TypeAheadField<String>(
        controller: _typeAheadController,
        suggestionsCallback: (pattern) async {
          return _allCities
              .where(
                (city) => city.toLowerCase().contains(pattern.toLowerCase()),
              )
              .take(10)
              .toList();
        },
        itemBuilder: (context, suggestion) {
          return ListTile(title: Text(suggestion));
        },
        onSelected: (suggestion) {
          _typeAheadController.text = suggestion;
          widget.onCitySelected(suggestion);
          Navigator.pop(context);
          _typeAheadController.clear();
        },
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: const InputDecoration(
              hintText: 'Enter city name',
              border: OutlineInputBorder(),
            ),
          );
        },
        loadingBuilder: (context) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: CircularProgressIndicator(),
        ),
        errorBuilder: (context, error) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Error occurred'),
        ),
        emptyBuilder: (context) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text('No cities found'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
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
          child: const Text('Search'),
        ),
      ],
    );
  }
}