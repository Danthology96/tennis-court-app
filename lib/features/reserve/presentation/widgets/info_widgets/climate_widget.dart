import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/reserve/domain/entities/entities.dart';

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
      final rain = weather!.data!.firstWhere((element) {
        rainProb = element.rain;
        return rainProb! > 0;
      });
      debugPrint("${rain.rain}");
    }
    return Row(
      children: [
        if (weather?.data?.first.weather?.first.icon != null)
          FadeInImage(
              width: 16,
              height: 16,
              placeholder: const AssetImage("assets/images/no-image.png"),
              image: NetworkImage(
                "$iconsServerUrl/${weather!.data!.first.weather!.first.icon}@2x.png",
              ))
        else
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
