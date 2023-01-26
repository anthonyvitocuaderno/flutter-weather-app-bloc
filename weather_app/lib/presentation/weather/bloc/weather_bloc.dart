import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.weatherRepository, required this.cityNameCountryCode,
  }) : super(const WeatherState()) {
    on<GetWeather>(_getWeather);
  }
  final WeatherRepository weatherRepository;
  final String cityNameCountryCode;

  void _getWeather(
      GetWeather event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weather = await weatherRepository.getWeather(cityNameCountryCode);
      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weather
        ),
      );
    } catch (error, stacktrace) {
      emit(state.copyWith(status: WeatherStatus.error));
    }
  }
}