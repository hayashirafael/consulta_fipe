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
    } catch (e) {
      return const LogoutAuthState();
    }
  }

  @override
  Future<AuthState> logout() async {
    await firebaseAuth.signOut();
    return const LogoutAuthState();
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
  Future<AuthState> register({required name, required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
