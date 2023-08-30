import 'package:firebase_auth/firebase_auth.dart';
import '../../interactor/entities/user_entity.dart';

class UserAdapter {
  static UserEntity fromFirebaseUser(User user) {
    return UserEntity(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      photoUrl: '',
    );
  }
}
