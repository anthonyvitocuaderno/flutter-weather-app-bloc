import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:weather_app/presentation/home/model/city_name_country_code.dart';
import 'package:weather_app/presentation/weather/weather_page.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<TextFieldChanged>(_onTextFieldChanged);
    on<HomeSubmitted>(_onSubmitted);
  }

  void _onTextFieldChanged(
      TextFieldChanged event,
      Emitter<HomeState> emit,
      ) {
    final cityNameCountryCode = CityNameCountryCode.dirty(event.cityNameCountryCode);
    emit(
      state.copyWith(
        cityNameCountryCode: cityNameCountryCode,
        status: Formz.validate([cityNameCountryCode]),
      ),
    );
  }

  Future<void> _onSubmitted(
      HomeSubmitted event,
      Emitter<HomeState> emit,
      ) async {
    // TODO
  }
}