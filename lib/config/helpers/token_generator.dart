import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// function to create a token for the user based on the user's email and password
Future<String> createToken(
    {required String email, required String password}) async {
  await dotenv.load(fileName: ".env");
  final secretKey = dotenv.env['JWT_SECRET_KEY'] ?? 'default-secret-key';
  // Create a JWT with the email and password as payload
  final jwt = JWT({
    'email': email,
    'password': password,
  });

  // Sign the JWT with a secret key
  final token = jwt.sign(SecretKey(secretKey));

  return token;
}

/// function to decode the token
Future<Map<String, dynamic>> decodeToken({required String token}) async {
  await dotenv.load(fileName: ".env");
  final secretKey = dotenv.env['JWT_SECRET_KEY'] ?? 'default-secret-key';
  // Verify and decode the JWT
  final jwt = JWT.verify(token, SecretKey(secretKey));

  return jwt.payload;
}
