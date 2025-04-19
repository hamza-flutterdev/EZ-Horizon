// this file contains lottie animations' logic

String getWeatherAnimation(String? condition) {
  if (condition == null) return 'lib/assets/Sunny.json';

  switch (condition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'dust':
    case 'fog':
      return 'lib/assets/Cloudy.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'lib/assets/Rainy.json';
    case 'thunderstorm':
      return 'lib/assets/Thunder.json';
    case 'clear':
      return 'lib/assets/Sunny.json';
    default:
      return 'lib/assets/Sunny.json';
  }
}