import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/config.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Test group for the Auth token
  group('Auth token', () {
    late String token;
    test("Token should encode to the DB", () async {
      String email = "daniel@gmail.com";
      String password = "123456";
      token = await createToken(email: email, password: password);

      debugPrint("Encoded token: $token");
      expect(token, isNotNull);
    });
    test("Token should be decoded", () async {
      final decoded = await decodeToken(token: token);
      debugPrint("Decoded token: $decoded");
      expect(decoded, isMap);
      expect(decoded, contains('email'));
      expect(decoded, contains('password'));
      expect(decoded['email'], 'daniel@gmail.com');
      expect(decoded['password'], '123456');
    });
  });
}
