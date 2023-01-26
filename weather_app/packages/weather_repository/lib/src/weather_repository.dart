import 'dart:async';

import 'package:open_weather_api/open_weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository({OpenWeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? OpenWeatherApiClient();

  final OpenWeatherApiClient _weatherApiClient;

  Future<Weather> getWeather(String cityNameCountryCode) async {
    print('get weather for cityNameCountryCode: $cityNameCountryCode');
    final location = await _weatherApiClient.locationSearch(cityNameCountryCode);

    final weather = await _weatherApiClient.getWeather(
      latitude: location.lat,
      longitude: location.lon,
    );
    return Weather(
      main: weather.main,
      description: weather.description,
      temperature: weather.temperature,
      pressure: weather.pressure,
      humidity: weather.humidity
    );
  }
}