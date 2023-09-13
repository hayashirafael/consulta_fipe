import 'package:consulta_fipe/src/features/auth/interactor/entities/user_entity.dart';

sealed class AuthState {
  const AuthState();
}

class LoggedAuthState implements AuthState {
  final UserEntity user;

  const LoggedAuthState(this.user);
}

class ErrorAuthState implements AuthState {
  final String? emailError;
  final String? passwordError;
  final String? nameError;

  const ErrorAuthState({this.emailError, this.passwordError, this.nameError});
}

class LogoutAuthState implements AuthState {
  const LogoutAuthState();
}

class LoadingAuthState implements AuthState {
  const LoadingAuthState();
}
