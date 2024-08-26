part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User? user;
  final String authMessage;

  const AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.authMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? authMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        authMessage: authMessage ?? this.authMessage,
      );

  @override
  List<Object?> get props => [authStatus, user, authMessage];
}
