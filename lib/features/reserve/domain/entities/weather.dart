import 'dart:convert';

import 'package:isar/isar.dart';
part 'weather.g.dart';

@embedded
class Weather {
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final List<Current>? data;

  Weather({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.data,
  });

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        data: json["data"] == null
            ? []
            : List<Current>.from(json["data"]!.map((x) => Current.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

@embedded
class Current {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final double? rain;
  final List<WeatherElement>? weather;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.rain,
    this.weather,
  });

  factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Current.fromMap(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"]?.toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"]?.toDouble(),
        windDeg: json["wind_deg"],
        rain: json["rain"]?.toDouble(),
        weather: json["weather"] == null
            ? []
            : List<WeatherElement>.from(
                json["weather"]!.map((x) => WeatherElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "rain": rain,
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toMap())),
      };
}

@embedded
class WeatherElement {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherElement({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherElement.fromJson(String str) =>
      WeatherElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
