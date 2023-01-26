import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/home/bloc/home_bloc.dart';

class WeatherSearchTextField extends StatelessWidget {
  const WeatherSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(64, 64, 64, 16),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
          previous.cityNameCountryCode !=
              current.cityNameCountryCode,
          builder: (context, state) {
            return TextField(
              key: const Key(
                  'weatherSearchForm_cityInput_textField'),
              onChanged: (text) => context
                  .read<HomeBloc>()
                  .add(TextFieldChanged(text)),
              decoration: InputDecoration(
                labelText: 'City',
                errorText: state.cityNameCountryCode.invalid
                    ? 'invalid city'
                    : null,
              ),
            );
          },
        ));
  }

}