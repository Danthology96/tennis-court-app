import '../../infrastructure/entities/user.dart';

/// Data origins for authentication
/// (Can be anyone, in this app, we will only have 1 datasource
/// (DB))
abstract class AuthDataSource {
  /// This function will login the user with the email and password
  Future<User?> loginUser({required String email, required String password});

  /// function that register a user in the database, it requires the user's info
  Future<bool?> registerUser({required Map<String, dynamic> user});

  // function to check if the user is logged or not
  Future<User?> checkAuthStatus({required String token});

  // function to logout the user
  Future<bool?> logoutUser({required String token});
}
