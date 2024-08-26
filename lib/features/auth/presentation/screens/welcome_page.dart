import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/config/helpers/enums.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/presentation/presentation.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  static const name = 'welcome';
  static const path = '/$name';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    final authCubit = context.read<AuthCubit>();
    authCubit.checkAuthStatus().then((value) {
      if (value != null) {
        context.go(HomePage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final authCubit = context.watch<AuthCubit>();
    final isLogged = authCubit.state.authStatus == AuthStatus.authenticated;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 120,
          right: 120,
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isLogged == false,
          child: Positioned(
              bottom: 50,
              left: 50,
              right: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomFilledButton(
                    text: 'Iniciar sesión',
                    onPressed: () {
                      context.pushNamed(LoginPage.name);
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFilledButton(
                    text: 'Registrarme',
                    onPressed: () {
                      context.pushNamed(RegisterPage.name);
                    },
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              )),
        )
      ],
    ));
  }
}
