import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static const String apiURL =
      'https://api.openweathermap.org/data/3.0/onecall';
  static String theMovieDBKey = dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
}
