//import 'package:http/retry.dart';

class Weather {
  final num temperature;
  final num feelslike;
  final num humidity;
  final num windspeed;
  final String description;
  final String icon;
  //final Map<String, dynamic> temperaturepressure;

  Weather({
    required this.temperature,
    required this.feelslike,
    required this.description,
    required this.windspeed,
    required this.humidity,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      humidity: json['main']['humidity'],
      temperature: (json['main']['temp'] - 273.15),
      feelslike: (json['main']['feels_like'] - 273.15),
      windspeed: json['wind']['speed'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
