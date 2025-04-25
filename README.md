# EZHorizon-Weather-App 🌤️  
*A Flutter Weather App*

**EZ-Horizon** is a sleek and lightweight weather application built as part of my personal Flutter portfolio. This project showcases my skills in API integration, location-based services, clean UI/UX design and state management in Flutter.

---

## 👨‍💻 About the Project

This app allows users to:  
- 🔍 Search for weather updates by city name  
- 📍 Use their current location to fetch live weather  
- 🌎 Select their location through country, state, and city dropdowns  
- 🎬 View animated weather visuals via Lottie  
- 💧 See detailed weather metrics including humidity, wind, visibility, and pressure  
- ☀️🌙 Check sunrise and sunset times  
- 🔄 Pull-to-refresh for latest weather updates  

---

## 🔧 Technologies & Packages Used

| Package | Purpose |
|---------|---------|
| [http](https://pub.dev/packages/http) | REST API integration |
| [geolocator](https://pub.dev/packages/geolocator) | Location services |
| [geocoding](https://pub.dev/packages/geocoding) | Coordinate conversion |
| [lottie](https://pub.dev/packages/lottie) | Animated weather illustrations |
| [country_state_city_picker](https://pub.dev/packages/country_state_city_picker) | Structured location selection |
| [flutter_typeahead](https://pub.dev/packages/flutter_typeahead) | Intelligent city search |
| [intl](https://pub.dev/packages/intl) | Date/time formatting |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | iOS-style icons |

---

## 🆕 Recent Updates

### 🌟 New Features
- Added comprehensive weather metrics:
  - 💧 Humidity 
  - 🌬️ Wind speed 
  - 👀 Visibility 
  - ⏲️ Pressure
  - ☀️🌙 Sunrise/sunset times
- Implemented pull-to-refresh functionality

### 🛠 Improvements
- Preloaded and cached `cities.json` for faster search
- Expanded city/country database
- Fixed UI overflow issues
- Optimized widget tree performance

---

## 📁 Project Structure

lib/
├── main.dart
├── screens/ # App screens
├── widgets/ # Reusable components
├── services/ # API & location logic
├── models/ # Data models
└── assets/ # Local data files

---


---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)
- Android Studio/VS Code
- Emulator or physical device

### Installation
```bash
git clone https://github.com/hamza-flutterdev/EZ-Horizon.git
```bash
cd EZ-Horizon
```bash
flutter pub get
```bash
flutter run

## 🎯 Key Features Demonstrated

| Feature              | Implementation Details                        |
|----------------------|-----------------------------------------------|
| **API Integration**  | OpenWeatherMap API with http package          |
| **Geolocation**      | GPS with fallback to network location         |
| **State Management** | setState with FutureBuilder                   |
| **UI/UX**            | Responsive design with Lottie animations      |
| **Performance**      | Cached city data, optimized widget tree       |
| **User Experience**  | Pull-to-refresh, intelligent typeahead search |

## 🙋‍♂️ About Me

**Hamza**  
Flutter Developer  

📧 `hamzabutthb553.hb@gmail.com`  
🔗 [LinkedIn Profile](https://linkedin.com/in/hamza-flutterdev)
