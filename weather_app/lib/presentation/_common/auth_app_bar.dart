import 'package:auth0_flutter/auth0_flutter.dart';
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
    final auth0 = Auth0('dev-k3ja7t6uaahzberl.us.auth0.com', '5UTWVYlQO9nt7M2QKqygeGyV2pWd6IUe');

    return ElevatedButton(
      child: Text(getStrings(context).logout),
      onPressed: () async {
        // TODO log out confirmation dialog
        // await auth0.webAuthentication().logout();
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationLogoutRequested());
      },
    );
  }
}