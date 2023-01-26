// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Weather',
      json,
      ($checkedConvert) {
        final val = Weather(
          main: $checkedConvert('main', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          temperature:
              $checkedConvert('temperature', (v) => (v as num).toDouble()),
          pressure: $checkedConvert('pressure', (v) => (v as num).toDouble()),
          humidity: $checkedConvert('humidity', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'temperature': instance.temperature,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
