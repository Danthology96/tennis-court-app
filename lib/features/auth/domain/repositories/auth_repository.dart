import '../../infrastructure/entities/user.dart';

/// Data origins for authentication
/// This datasource will use the local db (Isar)
abstract class AuthRepository {
  /// This function should return all the auth information like:
  /// - user info
  Future<User?> loginUser({required String email, required String password});

  /// function that register a user in the database, it requires the user's info
  Future<bool?> registerUser({required Map<String, dynamic> user});

  /// checks the status of the user
  Future<User?> checkAuthStatus({required String userToken});

  // function to logout the user
  Future<bool?> logoutUser({required String token});
}
