class Weather {
  final List<dynamic> weather;
  final Map<String, dynamic> temperaturepressure;

  Weather({
    required this.weather,
    required this.temperaturepressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      weather: json['weather'],
      temperaturepressure: Map.from(json['main']),
    );
  }
}
