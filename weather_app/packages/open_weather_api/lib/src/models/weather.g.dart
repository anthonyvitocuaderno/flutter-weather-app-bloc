// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

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
          temperature: $checkedConvert('temp', (v) => (v as num).toDouble()),
          humidity: $checkedConvert('humidity', (v) => (v as num).toDouble()),
          pressure: $checkedConvert('pressure', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );
