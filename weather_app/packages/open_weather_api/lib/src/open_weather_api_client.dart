import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather_api/open_weather_api.dart';

/// Exception thrown when locationSearch fails.
class LocationRequestFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

class OpenWeatherApiClient {
  OpenWeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrlWeather = 'api.openweathermap.org';

  // TODO environment variables
  static const _apiKey = 'a134f97af88f670840f10fd3315fa3e2';

  final http.Client _httpClient;

  Future<Location> locationSearch(String cityNameCountryCodeCsv) async {
    late Uri locationRequest;
    try {
      locationRequest = Uri.https(
        _baseUrlWeather,
        'geo/1.0/direct',
        {'q': cityNameCountryCodeCsv, 'limit': '1', 'appid': _apiKey},
      );
    } catch (e) {
      // TODO
      print(e);
    }

    print(locationRequest);
    final locationResponse = await _httpClient.get(locationRequest);

    if (locationResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final results = jsonDecode(locationResponse.body) as List;

    if (results.isEmpty) throw LocationNotFoundFailure();

    return Location.fromJson(results.first as Map<String, dynamic>);
  }

  /// Fetches [Weather] for a given [latitude] and [longitude].
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final weatherRequest = Uri.https(_baseUrlWeather, 'data/2.5/weather',
        {'lat': '$latitude', 'lon': '$longitude', 'appid': _apiKey});

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('weather') || !bodyJson.containsKey('main')) {
      throw WeatherNotFoundFailure();
    }
    final main = bodyJson['main'] as Map<String, dynamic>;
    final currentWeather =
        (bodyJson['weather'] as List).first as Map<String, dynamic>;
    currentWeather.putIfAbsent('temp', () => main['temp']);
    currentWeather.putIfAbsent('pressure', () => main['pressure']);
    currentWeather.putIfAbsent('humidity', () => main['humidity']);

    return Weather.fromJson(currentWeather);
  }
}
