import 'package:flutter/material.dart';

class ReservationListPage extends StatelessWidget {
  const ReservationListPage({super.key});

  static const name = 'reservation-list';
  static const path = '/$name';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Reservation List Page'),
      ),
    );
  }
}
