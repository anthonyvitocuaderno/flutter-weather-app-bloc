part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class TextFieldChanged extends HomeEvent {
  const TextFieldChanged(this.cityNameCountryCode);

  final String cityNameCountryCode;

  @override
  List<Object> get props => [cityNameCountryCode];
}

class HomeSubmitted extends HomeEvent {
  const HomeSubmitted();

  @override
  List<Object> get props => [];
}