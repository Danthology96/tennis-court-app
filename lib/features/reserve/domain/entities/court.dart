import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

part 'court.g.dart';

/// Court class, contains all the info of the Tennis Court
@collection
class Court {
  final Id? isarId;
  final String? id;
  final String? name;
  @enumerated
  final CourtType courtType;
  final double? pricePerHour;
  final LatLng? latLngLocation;
  final String? address;
  final List<String>? instructors;
  final List<String>? imagePaths;
  final List<int>? reservations;
  @ignore
  final Weather? weather;

  const Court({
    this.isarId,
    this.id,
    this.name,
    this.courtType = CourtType.A,
    this.imagePaths,
    this.pricePerHour,
    this.latLngLocation,
    this.address,
    this.instructors,
    this.reservations,
    this.weather,
  });

  factory Court.fromJson(String str, {String? token}) =>
      Court.fromMap(json.decode(str), token: token);

  String toJson() => json.encode(toMap());

  factory Court.fromMap(Map<String, dynamic> json, {String? token}) {
    return Court(
      id: json["id"],
      name: json["names"],
      courtType: json["courtType"],
      pricePerHour: json["pricePerHour"],
      latLngLocation: json["latLngLocation"],
      address: json["address"],
      instructors: json["instructors"],
      imagePaths: json["imagePaths"],
      reservations: json["reservations"],
      weather: json["weather"],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'names': name,
        'courtType': courtType,
        'pricePerHour': pricePerHour,
        'latLngLocation': latLngLocation,
        'address': address,
        'instructors': instructors,
        'imagePaths': imagePaths,
        'reservations': reservations,
        'weather': weather,
      };
  Court copyWith({
    String? id,
    String? name,
    CourtType? courtType,
    double? pricePerHour,
    LatLng? latLngLocation,
    String? address,
    List<String>? instructors,
    List<String>? imagePaths,
    List<int>? reservations,
    Weather? weather,
  }) =>
      Court(
        id: id ?? this.id,
        name: name ?? this.name,
        courtType: courtType ?? this.courtType,
        pricePerHour: pricePerHour ?? this.pricePerHour,
        latLngLocation: latLngLocation ?? this.latLngLocation,
        address: address ?? this.address,
        instructors: instructors ?? this.instructors,
        imagePaths: imagePaths ?? this.imagePaths,
        reservations: reservations ?? this.reservations,
        weather: weather ?? this.weather,
      );
}
