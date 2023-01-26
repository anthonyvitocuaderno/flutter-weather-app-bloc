import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/weather/bloc/weather_bloc.dart';
import 'package:weather_repository/src/models/weather.dart';

class WeatherTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blockBuilder = BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, current) =>
          prev.weather != current.weather && current.weather != null,
      builder: (context, state) {
        final weather = state.weather;
        return weather == null ? const CircularProgressIndicator() : _Table(weather);
      },
    );

    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {},
      child: blockBuilder,
    );
  }
}

class _Table extends StatelessWidget {
  final Weather weather;

  const _Table(this.weather);

  // TODO WEB/TABLET VIEW TABLE
  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children: [
          const TableRow(children: [
            TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Date(mm/dd/yyyy)', style: TextStyle(fontWeight: FontWeight.bold)),
                )
            ),
            TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Temp(F)', style: TextStyle(fontWeight: FontWeight.bold),),
                )
            ),
          ]),
          TableRow(children: [
            // TODO get datestring somewhere else
            TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(DateFormat('MM/dd/yyyy').format(DateTime.now())),
                )
            ),
            TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(weather.temperatureF),
                )
            ),
          ]),
        ]);
  }
}
