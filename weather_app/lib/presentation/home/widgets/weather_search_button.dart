import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:weather_app/presentation/home/bloc/home_bloc.dart';
import 'package:weather_app/presentation/weather/weather_page.dart';
import 'package:weather_app/util/string_utils.dart';

class WeatherSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _context = context;
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.cityNameCountryCode != current.cityNameCountryCode,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('weatherSearchForm_continue_raisedButton'),
                onPressed: state.status.isValidated
                    ? () {
                        _context.read<HomeBloc>().add(
                            const HomeSubmitted());
                        Navigator.push(context,
                            WeatherPage.route(state.cityNameCountryCode.value));
                      }
                    : null,
                child: Text(getStrings(context).weather_search_button_text),
              );
      },
    );
  }
}
