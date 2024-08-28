import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tennis_court_app/features/reserve/infrastructure/entities/entities.dart';

class ClimateWidget extends StatelessWidget {
  const ClimateWidget({
    super.key,
    this.weather,
  });
  final Weather? weather;
  @override
  Widget build(BuildContext context) {
    double? rainProb = 0;
    if (weather != null) {
      final rain = weather!.hourly!.firstWhere((element) {
        rainProb = element.rain!.the1H;
        return rainProb! > 0;
      });
      debugPrint("${rain.rain?.the1H}");
    }
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/rainy_icon.svg',
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 5),
        Text(
          rainProb != null ? "$rainProb" : 'N/A',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
