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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    double? rainProb = weather != null ? checkRainProbability(weather!) : 0;
    final currentWeather = weather?.data?.first.weather?.first;
    return Column(
      children: [
        Row(
          children: [
            if (currentWeather != null)
              FadeInImage(
                width: 24,
                height: 24,
                placeholder: const AssetImage("assets/images/no-image.png"),
                fit: BoxFit.cover,
                image: NetworkImage(
                  "$iconsServerUrl/${currentWeather.icon}@2x.png",
                ),
                color: colorScheme.tertiary,
              )
            else
              SvgPicture.asset(
                'assets/icons/rainy_icon.svg',
                width: 16,
                height: 16,
              ),
            const SizedBox(width: 5),
            Text(
              rainProb != null ? "$rainProb%" : 'N/A',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        Text(
          currentWeather?.description ?? 'N/A',
          style: textTheme.labelSmall
              ?.copyWith(color: colorScheme.onSurfaceVariant, fontSize: 8),
        )
      ],
    );
  }

  double? checkRainProbability(Weather weather) {
    double? rainProb = 0;
    final currentWeather = weather.data!.first.weather!.first;

    switch (currentWeather.main) {
      case 'Rain':
        rainProb = currentWeather.description == 'light rain' ? 30 : 60;
        break;
      case 'Drizzle':
        rainProb = 40;
        break;
      case 'Thunderstorm':
        rainProb = 80;
        break;
      case 'Snow':
        rainProb = 50;
        break;
      case 'Clear':
        rainProb = 0;
        break;
      case 'Clouds':
        rainProb = 20;
        break;
    }
    return rainProb;
  }
}
