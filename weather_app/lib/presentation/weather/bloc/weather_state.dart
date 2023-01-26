part of 'weather_bloc.dart';

enum WeatherStatus { success, error, loading }

extension WeatherStatusX on WeatherStatus {
  bool get isSuccess => this == WeatherStatus.success;
  bool get isError => this == WeatherStatus.error;
  bool get isLoading => this == WeatherStatus.loading;
}

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.loading,
    this.weather
  });

  final Weather? weather;
  final WeatherStatus status;

  @override
  List<Object?> get props => [status, weather];

  WeatherState copyWith({
    Weather? weather,
    required WeatherStatus status,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      status: status
    );
  }
}