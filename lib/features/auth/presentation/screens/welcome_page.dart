import 'package:flutter/material.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const name = 'welcome';
  static const path = '/$name';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomFilledButton(
                  text: 'Iniciar sesión',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                CustomFilledButton(
                  text: 'Registrarme',
                  onPressed: () {},
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ))
      ],
    ));
  }
}
