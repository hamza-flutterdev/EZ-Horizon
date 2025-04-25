// This file store cities.json file as cache

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CityDataCache {
  // Singleton pattern
  static final CityDataCache _instance = CityDataCache._internal();
  factory CityDataCache() => _instance;
  CityDataCache._internal();

  List<String> _cities = [];
  bool _isLoaded = false;
  
  bool get isLoaded => _isLoaded;
  List<String> get cities => _cities;

  Future<void> loadCities() async {
    if (_isLoaded) return; // Already loaded
    
    try {
      final String jsonString = await rootBundle.loadString('lib/assets/cities.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      _cities = jsonData.cast<String>();
      _isLoaded = true;
      debugPrint('Cities loaded successfully: ${_cities.length} cities');
    } catch (e) {
      debugPrint('Error loading cities: $e');
      _isLoaded = false;
    }
  }
  
  List<String> searchCities(String query) {
    if (query.isEmpty || query.length < 2) return [];
    
    return _cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .take(10)
        .toList();
  }
}