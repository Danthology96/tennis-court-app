part of 'user_register_cubit.dart';

/// State of the register form cubit
class UserRegisterFormState extends Equatable {
  /// Current status of the form
  final FormStatus formStatus;

  /// Variable to know if the current state of the form is valid
  final bool isValid;

  /// Class default constructor
  const UserRegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  /// Using the copyWith method to know if there is a change in the state of the
  /// cubit
  UserRegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
  }) =>
      UserRegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
      );

  /// Equatable function to compare same class attributes
  @override
  List<Object> get props => [
        formStatus,
        isValid,
      ];
}
