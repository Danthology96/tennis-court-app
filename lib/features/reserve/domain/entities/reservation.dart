import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

part 'reservation.g.dart';

@Collection(inheritance: false)
class Reservation extends Equatable {
  final Id? isarId;
  final String? id;
  final String? userId;
  final String? courtId;
  @ignore
  final Court? court;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? commentary;
  final Weather? weather;

  const Reservation({
    this.isarId,
    this.id,
    this.userId,
    this.courtId,
    this.court,
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
      'courtId': courtId,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'commentary': commentary,
    };
  }

  Reservation copyWith({
    String? id,
    String? userId,
    String? courtId,
    Court? court,
    DateTime? startDate,
    DateTime? endDate,
    String? commentary,
    Weather? weather,
  }) {
    return Reservation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      court: court ?? this.court,
      courtId: courtId ?? this.courtId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      commentary: commentary ?? this.commentary,
      weather: weather ?? this.weather,
    );
  }

  @override
  @ignore
  List<Object?> get props => [
        id,
        userId,
        courtId,
        court,
        startDate,
        endDate,
        commentary,
        weather,
      ];
}
