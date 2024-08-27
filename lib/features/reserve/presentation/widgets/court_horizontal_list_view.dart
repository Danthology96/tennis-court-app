import 'package:flutter/material.dart';
import 'package:tennis_court_app/features/reserve/presentation/presentation.dart';

class CourtsHorizontalListView extends StatelessWidget {
  const CourtsHorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          ReservationCard(),
          SizedBox(
            width: 20,
          ),
          ReservationCard(),
          SizedBox(
            width: 20,
          ),
          ReservationCard(),
        ],
      ),
    );
  }
}
