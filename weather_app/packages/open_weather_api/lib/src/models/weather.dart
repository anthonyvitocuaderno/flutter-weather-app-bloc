import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  const Weather({
    required this.main,
    required this.description,
    required this.temperature,
    required this.pressure,
    required this.humidity
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  final String main;
  final String description;
  final double temperature;
  final double pressure;
  final double humidity;
}
