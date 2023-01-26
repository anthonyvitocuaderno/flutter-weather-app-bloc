part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = FormzStatus.pure,
    this.cityNameCountryCode = const CityNameCountryCode.pure()
  });

  final FormzStatus status;
  final CityNameCountryCode cityNameCountryCode;

  HomeState copyWith({
    FormzStatus? status,
    CityNameCountryCode? cityNameCountryCode,
  }) {
    return HomeState(
      status: status ?? this.status,
      cityNameCountryCode: cityNameCountryCode ?? this.cityNameCountryCode
    );
  }

  @override
  List<Object> get props => [status, cityNameCountryCode];
}
