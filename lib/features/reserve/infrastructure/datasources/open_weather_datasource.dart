import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/helpers/environment.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

/// DataSource used for this app is openWeather, this is the api link:
/// https://api.openweathermap.org/data/3.0/onecall
class OpenWeatherDatasource extends WeatherDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiURL,
    queryParameters: {
      'appId': Environment.theMovieDBKey,
      'lang': 'sp',
    },
  ));

  @override
  Future<Weather?> getDayWeather(
      {required double lat, required double lng}) async {
    final response = await dio.get("", queryParameters: {
      'lat': lat,
      'lon': lng,
      'exclude': 'minutely,daily',
    });
    if (response.data != null) {
      return Weather.fromMap(response.data);
    } else {
      return null;
    }
  }

  @override
  Future<Weather?> getTimestampWeather(
      {required double lat,
      required double lng,
      required DateTime timestamp}) async {
    Response response;
    try {
      response = await dio.get("/timemachine", queryParameters: {
        'lat': lat,
        'lon': lng,
        "dt": timestamp.millisecondsSinceEpoch ~/ 1000,
      });
      if (response.data != null) {
        return Weather.fromMap(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
