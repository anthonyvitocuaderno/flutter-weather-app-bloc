import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:weather_app/data/authentication/bloc/authentication_bloc.dart';
import 'package:weather_app/presentation/login/bloc/login_bloc.dart';
import 'package:weather_app/presentation/login/widgets/login_form.dart';
import 'package:weather_app/util/string_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0('dev-k3ja7t6uaahzberl.us.auth0.com', '5UTWVYlQO9nt7M2QKqygeGyV2pWd6IUe');
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = LoginBloc(
      authenticationRepository:
      RepositoryProvider.of<AuthenticationRepository>(context),
      userRepository: context.select((AuthenticationBloc bloc) => bloc.userRepository,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(getStrings(context).title)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
            create: (context) {
              return _bloc;
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
                child: Column(
                  children: [
                    Text(
                      getStrings(context).welcome_greeting,
                      textAlign: TextAlign.justify,
                    ),
                    LoginForm(() async {
                      // TODO bloc
                      try {

                        final credentials =
                        await auth0.webAuthentication().login();
                        _bloc.add(LoginSubmitted(credentials.user.name ?? 'Anonymous', credentials.user.profileUrl.toString()));
                      } catch (e) {
                        print(e);
                      }
                    })
                  ],
                )
            )
        ),
      ),
    );
  }
}