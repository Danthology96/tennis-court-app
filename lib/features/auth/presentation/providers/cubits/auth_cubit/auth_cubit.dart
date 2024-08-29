import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/config/helpers/helpers.dart';
import 'package:tennis_court_app/features/auth/domain/domain.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';
import 'package:tennis_court_app/features/shared/services/key_value_storage_service.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepository,
    required this.secureStorageService,
  }) : super(const AuthState());

  final AuthRepository authRepository;
  final KeyValueStorageService secureStorageService;

  /// Method to login user from the local DB
  Future<bool?> loginUser(
      String email, String password, bool rememberMe) async {
    emit(state.copyWith(authStatus: AuthStatus.checking));
    final user =
        await authRepository.loginUser(email: email, password: password);
    if (user != null) {
      /// If request is success, it will login the user
      return await setLoggedUser(user: user, rememberMe: true).then((value) {
        if (value == true) {
          return true;
        }
        // Otherwise, it will return null
        return false;
      });
    } else {
      logout();
      return false;
    }
  }

  Future<bool?> registerUser(Map<String, dynamic> user) async {
    emit(state.copyWith(authStatus: AuthStatus.checking));
    return await authRepository.registerUser(user: user).then((value) {
      if (value!) {
        /// If no error is thrown, the state of the authstatus will change
        emit(state.copyWith(authStatus: AuthStatus.registered));
        return true;
      } else {
        logout(errorMessage: "Algo salió mal");
        emit(state.copyWith(authStatus: AuthStatus.notRegistered));
        return false;
      }
    });
  }

  Future<User?> checkAuthStatus() async {
    /// Reads if user has the token in the device
    final token = await secureStorageService.getValue<String>("token");
    debugPrint(token);
    if (token == null) {
      logout();
      return null;
    }
    try {
      final user = await authRepository.checkAuthStatus(userToken: token);
      // If finds a user, it will return the user
      return setLoggedUser(user: user!, rememberMe: true).then((value) {
        if (value == true) {
          return user;
        }
        // Otherwise, it will return null
        return null;
      });
    } catch (e) {
      logout();
    }
    return null;
  }

  Future<void> logout({String? errorMessage}) async {
    /// In case of logout, it will reset the notifications and cart states
    await secureStorageService.removeKey("token");
    if (state.user != null) {
      if (state.user?.token?.isNotEmpty == true) {
        await authRepository
            .logoutUser(token: state.user?.token ?? '')
            .then((value) {
          if (value == true) {
            emit(state.copyWith(
              authStatus: AuthStatus.notAuthenticated,
              user: User.empty(),
              authMessage: errorMessage,
            ));
          }
        });
      }
    }
  }

  /// Sets the current logged user to the authcubit
  Future<bool> setLoggedUser(
      {required User user, String? message, required bool rememberMe}) async {
    emit(state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      authMessage: message,
    ));
    if (rememberMe) {
      await secureStorageService.setKeyValue("token", user.token);
    }
    return true;
  }
}
