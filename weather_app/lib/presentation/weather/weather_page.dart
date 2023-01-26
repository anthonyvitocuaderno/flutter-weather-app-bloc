import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/_common/auth_app_bar.dart';
import 'package:weather_app/presentation/weather/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/weather/widgets/weather_table.dart';
import 'package:weather_app/util/string_utils.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {

  static Route<void> route(String cityNameCountryCode) {
    return MaterialPageRoute<void>(builder: (_) => WeatherPage(cityNameCountryCode: cityNameCountryCode));
  }

  final String cityNameCountryCode;

  const WeatherPage({super.key, required this.cityNameCountryCode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return WeatherBloc(
          cityNameCountryCode: cityNameCountryCode,
          weatherRepository: WeatherRepository(),
        );
      },
      child: WeatherView(cityNameCountryCode: cityNameCountryCode),
    );
  }
}

class WeatherView extends StatefulWidget {
  final String cityNameCountryCode;

  const WeatherView({super.key, required this.cityNameCountryCode});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {

  @override
  void initState() {
    context.read<WeatherBloc>().add(GetWeather());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(getStrings(context).title),
      body: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 64,
              ),
              BlocListener<WeatherBloc, WeatherState>(
                  listener: (context, state) {
                    // TODO fetch if failed
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WeatherTable(),
                        const SizedBox(height: 64,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(getStrings(context).back),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        )
    );
  }
}
