import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/reserve/presentation/presentation.dart';

class CourtsHorizontalListView extends StatelessWidget {
  const CourtsHorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: defaultCourts.map((court) {
          return ReservationCard(court: court);
        }).toList(),
      ),
    );
  }
}
