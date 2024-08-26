import 'package:flutter/material.dart';

class ReservesPage extends StatelessWidget {
  const ReservesPage({super.key});

  static const name = 'reserves';
  static const path = '/$name';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Reserves Page'),
      ),
    );
  }
}
