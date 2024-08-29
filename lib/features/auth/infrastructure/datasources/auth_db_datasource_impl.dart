import 'dart:math';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tennis_court_app/config/config.dart';

import 'package:tennis_court_app/features/auth/domain/domain.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/presentation/widgets/toasts/toast_alerts_widget.dart';

/// Class that contains the local db as the source
class AuthDBDataSourceImpl implements AuthDataSource {
  late Future<Isar> db;

  AuthDBDataSourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema, CourtSchema, ReservationSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  /// Register a user to the local database
  @override
  Future<bool?> registerUser({required Map<String, dynamic> user}) async {
    customToastAlerts(type: AlertType.loading);
    final isar = await db;
    final users = isar.users;

    /// checks if the user exists in the database (based on email)
    final userExists =
        await users.filter().emailEqualTo(user['email']).findFirst();

    /// if the user exists, return false
    if (userExists != null) {
      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.success, message: 'Usuario no registrado');
      return false;
    } else {
      final random = Random();
      final id = random.nextInt(1000);

      /// method to add the user to the database
      await isar.writeTxn(() async {
        /// if the user does not exist, add the user to the database
        await users.put(User(
            id: id.toString(),
            names: user['names'],
            email: user['email'],
            phone: user['phone'],
            password: user['password'],
            token: await createToken(
                email: user['email'], password: user['password'])));
      });

      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.success, message: 'Usuario registrado correctamente');
      return true;
    }
  }

  /// Login the user directly from the local database
  @override
  Future<User?> loginUser(
      {required String email, required String password}) async {
    customToastAlerts(type: AlertType.loading);
    final isar = await db;
    final user = await isar.users
        .where()
        .filter()
        .emailEqualTo(email)
        .passwordEqualTo(password)
        .findFirst();
    if (user != null) {
      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.success, message: 'Bienvenido ${user.names}');
      return user;
    } else {
      /// to simulate a loading time
      await closeLoadingScreen();
      customToastAlerts(
          type: AlertType.error, message: 'email o contraseña incorrectos');
    }

    return user;
  }

  /// Checks if the user exists in the local DB with the token stored in the device,
  /// otherwise, the user will need to login
  @override
  Future<User?> checkAuthStatus({required String token}) async {
    final isar = await db;
    final user =
        await isar.users.where().filter().tokenEqualTo(token).findFirst();
    return user;
  }

  /// function to remove the user token from the local database
  @override
  Future<bool?> logoutUser({required String token}) async {
    final isar = await db;
    final user =
        await isar.users.where().filter().tokenEqualTo(token).findFirst();
    if (user != null) {
      /// modifies the token to null
      await isar.writeTxn(() async {
        await isar.users.put(user.copyWith(token: null));
      });

      return true;
    }
    return false;
  }
}
