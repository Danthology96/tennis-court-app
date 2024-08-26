import 'package:tennis_court_app/features/auth/domain/domain.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';

/// Implementation of the local database repository
class AuthDBRepositoryImpl extends AuthRepository {
  final AuthDataSource? dataSource;

  AuthDBRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDBDataSourceImpl();

  /// Implementation of the dataSource to register a user to the local
  @override
  Future<bool?> registerUser({required Map<String, dynamic> user}) {
    return dataSource!.registerUser(user: user);
  }

  /// Implementation of the dataSource to login a user from the local
  @override
  Future<User?> loginUser({required String email, required String password}) {
    return dataSource!.loginUser(email: email, password: password);
  }

  @override
  Future<User?> checkAuthStatus({required String userToken}) {
    return dataSource!.checkAuthStatus(token: userToken);
  }

  @override
  Future<bool?> logoutUser({required String token}) {
    return dataSource!.logoutUser(token: token);
  }
}
