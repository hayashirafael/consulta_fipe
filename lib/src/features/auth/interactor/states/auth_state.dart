import 'package:consulta_fipe/src/features/auth/interactor/entities/user_entity.dart';

sealed class AuthState {
  const AuthState();
}

class LoggedAuthState implements AuthState {
  final UserEntity user;

  const LoggedAuthState(this.user);
}

class LogoutAuthState implements AuthState {
  const LogoutAuthState();
}

class LoadingAuthState implements AuthState {
  const LoadingAuthState();
}
