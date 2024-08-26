import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart' as crypto;

/// function to create a token for the user based on the user's email and password
String createToken({required String email, required String password}) {
  // Concatenate the email and password
  String data = email + password;

  // Create a SHA256 hash of the concatenated data
  var bytes = utf8.encode(data);
  var digest = crypto.sha256.convert(bytes);

  // Return the hexadecimal representation of the hash
  return digest.toString();
}

/// function to decode the token
String decodeToken({required String token}) {
  // Decode the token
  var decoded = utf8.decode(base64.decode(token));
  return decoded;
}
