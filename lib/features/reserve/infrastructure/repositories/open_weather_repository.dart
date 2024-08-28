import 'package:tennis_court_app/features/reserve/reserve.dart';

class OpenWeatherRepository extends WeatherRepository {
  final WeatherDataSource? dataSource;

  OpenWeatherRepository({WeatherDataSource? dataSource})
      : dataSource = dataSource ?? OpenWeatherDatasource();

  @override
  Future<Weather?> getDayWeather(
      {required double lat, required double lng}) async {
    return dataSource!.getDayWeather(lat: lat, lng: lng);
  }

  @override
  Future<Weather?> getTimestampWeather(
      {required double lat,
      required double lng,
      required DateTime timestamp}) async {
    return dataSource!
        .getTimestampWeather(lat: lat, lng: lng, timestamp: timestamp);
  }
}
