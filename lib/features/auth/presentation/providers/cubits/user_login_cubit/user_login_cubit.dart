import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court_app/config/helpers/helpers.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';
import 'package:tennis_court_app/features/auth/presentation/providers/cubits/cubits.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  final AuthDBRepositoryImpl authRepository;
  final AuthCubit authCubit;
  UserLoginCubit({required this.authRepository, required this.authCubit})
      : super(const UserLoginState());

  /// Function that triggers when the user clicks the "iniciar sesión" button
  /// returns true if login is successfull
  Future<bool?> onSubmit(String email, String password) async {
    emit(state.copyWith(
      isPosted: true,
    ));

    /// If the form is valid, it will call the auth cubit to login the user
    if (state.isValid) {
      emit(state.copyWith(formStatus: FormStatus.posting));

      /// Calls the auth cubit to login the user
      return await authCubit.loginUser(email, password, state.rememberMe);
    } else {
      emit(state.copyWith(formStatus: FormStatus.invalid));
      return false;
    }
  }

  /// Method when user checks/unchecks the box of remember me in login form
  void rememberMeChanged() {
    if (state.rememberMe == true) {
      emit(state.copyWith(rememberMe: false));
    } else {
      emit(state.copyWith(rememberMe: true));
    }
  }
}
