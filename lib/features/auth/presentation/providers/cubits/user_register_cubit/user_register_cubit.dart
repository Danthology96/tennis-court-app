import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court_app/config/helpers/helpers.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';
import 'package:tennis_court_app/features/auth/presentation/providers/cubits/cubits.dart';

part 'user_register_state.dart';

/// Cubit of the register form
class UserRegisterCubit extends Cubit<UserRegisterFormState> {
  /// need to call a repository
  final AuthDBRepositoryImpl authRepository;
  final AuthCubit authCubit;
  UserRegisterCubit({
    required this.authRepository,
    required this.authCubit,
  }) : super(const UserRegisterFormState());

  /// Function that triggers when the user clicks the "registrarme" button
  Future<bool?> onSubmit(Map<String, dynamic> user) async {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
    ));

    final userJson = {
      "names": user["names"],
      "email": user["email"],
      "password": user["password"],
      "phone": user["phone"],
    };
    emit(state.copyWith(formStatus: FormStatus.posting));
    return await authCubit.registerUser(userJson).then((value) {
      if (value == true) {
        emit(state.copyWith(formStatus: FormStatus.success));
      } else {
        emit(state.copyWith(formStatus: FormStatus.failed));
      }
      return value;
    });
  }
}
