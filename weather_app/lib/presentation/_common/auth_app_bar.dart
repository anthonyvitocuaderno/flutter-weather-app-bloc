import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/authentication/index.dart';
import 'package:weather_app/util/string_utils.dart';

class AuthAppBar extends AppBar {
  AuthAppBar(String title, {super.key}): super(
    title: Text(title),
    automaticallyImplyLeading: false,
    actions: [
      _LogoutButton()
    ],
  );
}

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(getStrings(context).logout),
      onPressed: () {
        // TODO log out confirmation dialog
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationLogoutRequested());
      },
    );
  }
}