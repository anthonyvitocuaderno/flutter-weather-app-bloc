import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:weather_app/presentation/_common/auth_app_bar.dart';
import 'package:weather_app/presentation/home/bloc/home_bloc.dart';
import 'package:weather_app/presentation/home/widgets/git_name.dart';
import 'package:weather_app/presentation/home/widgets/weather_search_button.dart';
import 'package:weather_app/presentation/home/widgets/weather_search_text_field.dart';
import 'package:weather_app/util/string_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AuthAppBar(getStrings(context).title),
        body: BlocProvider(
          create: (context) {
            return HomeBloc();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 64,
              ),
              const GitName(),
              BlocListener<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state.status.isSubmissionFailure) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Failed')),
                        );
                    }
                  },
                  child: Align(
                    alignment: const Alignment(0, -1 / 3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const WeatherSearchTextField(),
                        WeatherSearchButton()
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
