import 'package:tennis_court_app/features/auth/domain/domain.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';

/// Class that contains the local db as the source
class AuthDBDataSourceImpl implements AuthDataSource {
  /// Register a user to the local database
  @override
  Future<bool?> registerUser({required Map<String, dynamic> user}) async {
    //TODO: Implement the register user method
  }

  /// Login the user directly from the local database
  @override
  Future<User?> loginUser(
      {required String email, required String password}) async {
    //TODO: Implement the login user method
  }

  /// Checks if the user exists in the local DB with the token stored in the device,
  /// otherwise, the user will need to login
  @override
  Future<User?> checkAuthStatus({required String token}) async {
    //TODO: Implement the check auth status method
  }

  @override
  Future<bool?> logoutUser({required String token}) async {
    //TODO: Implement the logout user method
  }
}
