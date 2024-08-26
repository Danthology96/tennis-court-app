part of 'user_login_cubit.dart';

class UserLoginState extends Equatable {
  /// Current status of the form
  final FormStatus formStatus;

  final bool isPosted;
  final bool rememberMe;

  /// Class default constructor
  const UserLoginState({
    this.formStatus = FormStatus.invalid,
    this.isPosted = false,
    this.rememberMe = true,
  });

  /// Using the copyWith method to know if there is a change in the state of the
  /// cubit
  UserLoginState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    bool? isPosted,
    bool? rememberMe,
  }) =>
      UserLoginState(
        formStatus: formStatus ?? this.formStatus,
        isPosted: isPosted ?? this.isPosted,
        rememberMe: rememberMe ?? this.rememberMe,
      );

  /// Equatable function to compare same class attributes
  @override
  List<Object> get props => [
        formStatus,
        rememberMe,
        isPosted,
      ];
}
