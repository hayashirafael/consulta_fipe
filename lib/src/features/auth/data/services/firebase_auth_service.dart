import 'package:consulta_fipe/src/features/auth/interactor/states/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../interactor/services/auth_service.dart';
import '../adapters/user_adapter.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService(this.firebaseAuth);

  @override
  Future<AuthState> login({required String email, required String password}) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        final user = UserAdapter.fromFirebaseUser(result.user!);
        return LoggedAuthState(user);
      } else {
        return const LogoutAuthState();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return const ErrorAuthState(passwordError: 'Senha incorreta');
      } else if (e.code == 'invalid-email') {
        return const ErrorAuthState(emailError: 'Email inválido');
      } else if (e.code == 'user-not-found') {
        return const ErrorAuthState(emailError: 'Email inválido');
      } else if (e.code == 'user-disabled') {
        return const ErrorAuthState(emailError: 'Conta desabilitada');
      } else {
        return const ErrorAuthState();
      }
    } catch (e) {
      return const LogoutAuthState();
    }
  }

  @override
  AuthState getUser() {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      final userEntity = UserAdapter.fromFirebaseUser(user);
      return LoggedAuthState(userEntity);
    }
    return const LogoutAuthState();
  }

  @override
  Future<AuthState> register({required String name, required String email, required String password}) async {
    try {
      if (name.isEmpty) {
        return const ErrorAuthState(nameError: 'Nome inválido');
      }
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(name);
      return const SuccessfulRegistrationAuthState();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const ErrorAuthState(emailError: 'Email já existe');
      } else if (e.code == 'invalid-email') {
        return const ErrorAuthState(emailError: 'Email inválido');
      } else if (e.code == 'weak-password') {
        return const ErrorAuthState(passwordError: 'Senha fraca');
      } else {
        return const ErrorAuthState();
      }
    } catch (e) {
      return const ErrorAuthState();
    }
  }

  @override
  Future<AuthState> logout() async {
    await firebaseAuth.signOut();
    return const LogoutAuthState();
  }
}
