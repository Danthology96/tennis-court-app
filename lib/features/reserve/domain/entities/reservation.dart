import 'package:isar/isar.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

part 'reservation.g.dart';

@collection
class Reservation {
  Id? isarId;
  final String? id;
  final String? userId;
  final String? courtId;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? commentary;
  final Weather? weather;

  Reservation({
    this.id,
    this.userId,
    this.courtId,
    this.startDate,
    this.endDate,
    this.commentary,
    this.weather,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      userId: json['userId'],
      courtId: json['courtId'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      commentary: json['commentary'],
      weather:
          json['weather'] != null ? Weather.fromJson(json['weather']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'roomId': courtId,
      'courtId': courtId,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'commentary': commentary,
      'weather': weather?.toJson(),
    };
  }

  Reservation copyWith({
    String? id,
    String? userId,
    String? courtId,
    DateTime? startDate,
    DateTime? endDate,
    String? commentary,
    Weather? weather,
  }) {
    return Reservation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      courtId: courtId ?? this.courtId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      commentary: commentary ?? this.commentary,
      weather: weather ?? this.weather,
    );
  }
}
