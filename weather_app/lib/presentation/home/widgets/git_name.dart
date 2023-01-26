import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/authentication/bloc/authentication_bloc.dart';

class GitName extends StatelessWidget {
  const GitName({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final name = context.select(
              (AuthenticationBloc bloc) => bloc.state.user.name,
        );
        final url = context.select(
              (AuthenticationBloc bloc) => bloc.state.user.url,
        );
        return Column(
          children: [
            Text('$name'),
            Text('$url'),
          ],
        );
      },
    );
  }

}