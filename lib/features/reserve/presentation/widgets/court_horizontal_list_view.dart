import 'package:flutter/material.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

class CourtsHorizontalListView extends StatefulWidget {
  const CourtsHorizontalListView({
    super.key,
  });

  @override
  State<CourtsHorizontalListView> createState() =>
      _CourtsHorizontalListViewState();
}

class _CourtsHorizontalListViewState extends State<CourtsHorizontalListView> {
  List<Court?>? courts;
  @override
  void initState() {
    super.initState();
    CourtRepositoryImpl().getCourts().then((value) {
      setState(() {
        courts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (courts == null) return const SizedBox();

    /// This widget will show a list of courts horizontally
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: courts!.map((court) {
          if (court == null) return const SizedBox();
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CourtCard(court: court),
          );
        }).toList(),
      ),
    );
  }
}
