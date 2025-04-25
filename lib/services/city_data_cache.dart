// This file store cities.json file as cache

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CityDataCache {
  static final CityDataCache _instance = CityDataCache._internal();
  factory CityDataCache() => _instance;
  CityDataCache._internal();

  List<String> _cities = [];
  bool _isLoaded = false;
  
  bool get isLoaded => _isLoaded;
  List<String> get cities => _cities;

  Future<void> loadCities() async {
    if (_isLoaded) return;
    
    try {
      final json = await rootBundle.loadString('lib/assets/cities.json');
      _cities = (jsonDecode(json) as List).cast<String>();
      _isLoaded = true;
      debugPrint('Cities loaded: ${_cities.length}');
    } catch (e) {
      debugPrint('Error loading cities: $e');
      _isLoaded = false;
    }
  }
  
  List<String> searchCities(String query) => query.isEmpty || query.length < 2 
    ? [] 
    : _cities
        .where((c) => c.toLowerCase().contains(query.toLowerCase()))
        .take(10)
        .toList();
}