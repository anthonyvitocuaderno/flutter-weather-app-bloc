import 'package:formz/formz.dart';

enum CityNameCountryCodeValidationError { empty }

class CityNameCountryCode extends FormzInput<String, CityNameCountryCodeValidationError> {
  const CityNameCountryCode.pure() : super.pure('');
  const CityNameCountryCode.dirty([super.value = '']) : super.dirty();

  @override
  CityNameCountryCodeValidationError? validator(String value) {
    if (value.isEmpty) return CityNameCountryCodeValidationError.empty;
    return null;
  }
}