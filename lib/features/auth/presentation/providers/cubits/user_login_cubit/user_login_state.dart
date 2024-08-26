part of 'user_login_cubit.dart';

class UserLoginState extends Equatable {
  /// Current status of the form
  final FormStatus formStatus;

  /// Variable to know if the current state of the form is valid
  final bool isValid;

  final bool isPosted;
  final bool rememberMe;

  /// Class default constructor
  const UserLoginState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
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
        isValid: isValid ?? this.isValid,
        isPosted: isPosted ?? this.isPosted,
        rememberMe: rememberMe ?? this.rememberMe,
      );

  /// Equatable function to compare same class attributes
  @override
  List<Object> get props => [
        formStatus,
        isValid,
        rememberMe,
        isPosted,
      ];
}
