import 'package:consulta_fipe/src/features/auth/interactor/states/auth_state.dart';

abstract interface class AuthService {
  Future<AuthState> login({
    required String email,
    required String password,
  });
  Future<AuthState> register({
    required name,
    required String email,
    required String password,
  });
  Future<AuthState> logout();
  AuthState getUser();
}
