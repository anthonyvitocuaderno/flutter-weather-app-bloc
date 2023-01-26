import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.main,
    required this.description,
    required this.temperature,
    required this.pressure,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final String main;
  final String description;
  final double temperature;
  final double pressure;
  final double humidity;

  String get temperatureF {
    return ((temperature - 273.15) * 9/5 + 32).toStringAsPrecision(2);
  }

  @override
  List<Object> get props => [main, description, temperature, pressure, humidity];
}
