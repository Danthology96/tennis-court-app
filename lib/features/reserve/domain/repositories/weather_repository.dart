import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Data origins for weather requestsrequired
/// This datasource will use the local db (Isar)
abstract class WeatherRepository {
  /// function that gets the current weather of a location
  Future<Weather?> getDayWeather({
    required double lat,
    required double lng,
  });

  /// function that gets the weather forecast of a location
  Future<Weather?> getTimestampWeather({
    required double lat,
    required double lng,
    required DateTime timestamp,
  });
}
