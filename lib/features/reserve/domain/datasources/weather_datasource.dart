import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Data origins for weather requests
/// This datasource will use the local db (Isar)
abstract class WeatherDataSource {
  /// function that gets the current weather of a location
  Future<Weather?> getDayWeather({
    double lat,
    double lng,
  });

  /// function that gets the weather forecast of a location
  Future<Weather?> getTimestampWeather({
    double lat,
    double lng,
    DateTime timestamp,
  });
}
