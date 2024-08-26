part of 'user_register_cubit.dart';

/// State of the register form cubit
class UserRegisterFormState extends Equatable {
  /// Current status of the form
  final FormStatus formStatus;

  /// Class default constructor
  const UserRegisterFormState({
    this.formStatus = FormStatus.invalid,
  });

  /// Using the copyWith method to know if there is a change in the state of the
  /// cubit
  UserRegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
  }) =>
      UserRegisterFormState(
        formStatus: formStatus ?? this.formStatus,
      );

  /// Equatable function to compare same class attributes
  @override
  List<Object> get props => [
        formStatus,
      ];
}
