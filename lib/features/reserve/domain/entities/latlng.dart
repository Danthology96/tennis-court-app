import 'package:isar/isar.dart';

part 'latlng.g.dart';

/// Class to represent a latitude and longitude pair
@embedded
class LatLng {
  final double? latitude;
  final double? longitude;

  LatLng({
    this.latitude,
    this.longitude,
  });
}
