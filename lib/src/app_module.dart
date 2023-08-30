import 'package:consulta_fipe/src/features/auth/data/services/firebase_auth_service.dart';
import 'package:consulta_fipe/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:consulta_fipe/src/features/auth/interactor/services/auth_service.dart';
import 'package:consulta_fipe/src/features/auth/ui/pages/home_page.dart';
import 'package:consulta_fipe/src/features/auth/ui/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
    i.add<AuthService>(FirebaseAuthService.new);
    i.addSingleton<AuthBloc>(AuthBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/login', child: (context) => const LoginPage());
  }
}
