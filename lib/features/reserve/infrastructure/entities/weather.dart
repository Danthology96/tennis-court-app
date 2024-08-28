import 'dart:convert';
import 'package:isar/isar.dart';

part 'weather.g.dart';

/// Class to represent the weather of the court
@embedded
class Weather {
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final Current? current;
  final List<Minutely>? minutely;
  final List<Current>? hourly;
  final List<Daily>? daily;

  Weather({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  });

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current:
            json["current"] == null ? null : Current.fromMap(json["current"]),
        minutely: json["minutely"] == null
            ? []
            : List<Minutely>.from(
                json["minutely"]!.map((x) => Minutely.fromMap(x))),
        hourly: json["hourly"] == null
            ? []
            : List<Current>.from(
                json["hourly"]!.map((x) => Current.fromMap(x))),
        daily: json["daily"] == null
            ? []
            : List<Daily>.from(json["daily"]!.map((x) => Daily.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current?.toMap(),
        "minutely": minutely == null
            ? []
            : List<dynamic>.from(minutely!.map((x) => x.toMap())),
        "hourly": hourly == null
            ? []
            : List<dynamic>.from(hourly!.map((x) => x.toMap())),
        "daily": daily == null
            ? []
            : List<dynamic>.from(daily!.map((x) => x.toMap())),
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
  final double? uvi;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final List<WeatherElement>? weather;
  final double? windGust;
  final double? pop;
  final Rain? rain;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.windGust,
    this.pop,
    this.rain,
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
        uvi: json["uvi"]?.toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"]?.toDouble(),
        windDeg: json["wind_deg"],
        weather: json["weather"] == null
            ? []
            : List<WeatherElement>.from(
                json["weather"]!.map((x) => WeatherElement.fromMap(x))),
        windGust: json["wind_gust"]?.toDouble(),
        pop: json["pop"]?.toDouble(),
        rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
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
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toMap())),
        "wind_gust": windGust,
        "pop": pop,
        "rain": rain?.toMap(),
      };
}

@embedded
class Rain {
  final double? the1H;

  Rain({
    this.the1H,
  });

  factory Rain.fromJson(String str) => Rain.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "1h": the1H,
      };
}

@embedded
class WeatherElement {
  final int? id;
  @enumerated
  final MainWeatherDesc main;
  @enumerated
  final WeatherDescription description;
  final String? icon;

  WeatherElement({
    this.id,
    this.main = MainWeatherDesc.clear,
    this.description = WeatherDescription.clearSky,
    this.icon,
  });

  factory WeatherElement.fromJson(String str) =>
      WeatherElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: MainWeatherDesc.fromString(json["main"]),
        description: WeatherDescription.fromString(json["description"]),
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": MainWeatherDesc.values[main.index],
        "description": WeatherDescription.values[description.index],
        "icon": icon,
      };
}

enum WeatherDescription {
  brokenClouds,
  clearSky,
  fewClouds,
  lightRain,
  moderateRain,
  overcastClouds,
  scatteredClouds;

  static WeatherDescription fromString(String value) {
    switch (value) {
      case "broken clouds":
        return WeatherDescription.brokenClouds;
      case "clear sky":
        return WeatherDescription.clearSky;
      case "few clouds":
        return WeatherDescription.fewClouds;
      case "light rain":
        return WeatherDescription.lightRain;
      case "moderate rain":
        return WeatherDescription.moderateRain;
      case "overcast clouds":
        return WeatherDescription.overcastClouds;
      case "scattered clouds":
        return WeatherDescription.scatteredClouds;
      default:
        return WeatherDescription.clearSky;
    }
  }
}

enum MainWeatherDesc {
  clear,
  clouds,
  rain;

  static MainWeatherDesc fromString(String value) {
    switch (value) {
      case "Clear":
        return MainWeatherDesc.clear;
      case "Clouds":
        return MainWeatherDesc.clouds;
      case "Rain":
        return MainWeatherDesc.rain;
      default:
        return MainWeatherDesc.clear;
    }
  }
}

@embedded
class Daily {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final double? moonPhase;
  final String? summary;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<WeatherElement>? weather;
  final int? clouds;
  final double? pop;
  final double? rain;
  final double? uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.summary,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"]?.toDouble(),
        summary: json["summary"],
        temp: json["temp"] == null ? null : Temp.fromMap(json["temp"]),
        feelsLike: json["feels_like"] == null
            ? null
            : FeelsLike.fromMap(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"]?.toDouble(),
        windSpeed: json["wind_speed"]?.toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"]?.toDouble(),
        weather: json["weather"] == null
            ? []
            : List<WeatherElement>.from(
                json["weather"]!.map((x) => WeatherElement.fromMap(x))),
        clouds: json["clouds"],
        pop: json["pop"]?.toDouble(),
        rain: json["rain"]?.toDouble(),
        uvi: json["uvi"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "summary": summary,
        "temp": temp?.toMap(),
        "feels_like": feelsLike?.toMap(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toMap())),
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
        "uvi": uvi,
      };
}

@embedded
class FeelsLike {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

@embedded
class Temp {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"]?.toDouble(),
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

@embedded
class Minutely {
  final int? dt;
  final int? precipitation;

  Minutely({
    this.dt,
    this.precipitation,
  });

  factory Minutely.fromJson(String str) => Minutely.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Minutely.fromMap(Map<String, dynamic> json) => Minutely(
        dt: json["dt"],
        precipitation: json["precipitation"],
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "precipitation": precipitation,
      };
}
