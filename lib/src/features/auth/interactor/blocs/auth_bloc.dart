import 'package:consulta_fipe/src/features/auth/interactor/events/auth_event.dart';
import 'package:consulta_fipe/src/features/auth/interactor/services/auth_service.dart';
import 'package:consulta_fipe/src/features/auth/interactor/states/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService service;
  AuthBloc(this.service) : super(const LogoutAuthState()) {
    on<LoginAuthEvent>(_loginAuthEvent);
    on<RegisterAuthEvent>(_registerAuthEvent);
    on<LogoutAuthEvent>(_logoutAuthEvent);
  }

  Future<void> _loginAuthEvent(LoginAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());

    final newState = await service.login(
      email: event.email,
      password: event.password,
    );
    emit(newState);
  }

  Future<void> _registerAuthEvent(RegisterAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());

    final newState = await service.register(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    emit(newState);
  }

  Future<void> _logoutAuthEvent(LogoutAuthEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());
    await service.logout();
    emit(const LogoutAuthState());
  }
}
