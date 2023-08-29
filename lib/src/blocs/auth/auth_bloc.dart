import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthSignUpEvent>(signUp);
    on<AuthSignInEvent>(signIn);
    on<AuthSignOutEvent>(signOut);
  }

  void signUp(AuthSignUpEvent event, Emitter<AuthState> emit) {}
  void signIn(AuthSignInEvent event, Emitter<AuthState> emit) {}
  void signOut(AuthSignOutEvent event, Emitter<AuthState> emit) {}
}
