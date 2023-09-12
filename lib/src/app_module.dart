import 'package:consulta_fipe/src/features/auth/auth_module.dart';
import 'package:consulta_fipe/src/features/auth/ui/pages/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
    r.module('/auth', module: AuthModule());
  }
}
