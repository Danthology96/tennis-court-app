import 'dart:convert';
import 'package:isar/isar.dart';

part 'user.g.dart';

/// User class, contains all the info of the user
@collection
class User {
  Id? isarId; // you can also use id = null to auto increment
  @Index(unique: true)
  final String id;
  final String? token;
  final String names;
  final String email;
  final String? password;
  final String phone;

  User({
    required this.id,
    required this.names,
    required this.email,
    this.token,
    this.password,
    required this.phone,
  });

  User copyWith({
    String? id,
    String? names,
    String? email,
    String? password,
    String? phone,
    String? token,
  }) =>
      User(
        id: id ?? this.id,
        names: names ?? this.names,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        token: token ?? this.token,
      );

  factory User.empty() =>
      User(id: "", names: "", email: "", password: "", phone: "");

  factory User.fromJson(String str, {String? token}) =>
      User.fromMap(json.decode(str), token: token);

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json, {String? token}) {
    return User(
      id: json["id"],
      token: token ?? '',
      names: json["names"] ?? '',
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "names": names,
        "email": email,
        "phone": phone,
      };
}
