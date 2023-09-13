import 'package:consulta_fipe/src/features/auth/auth_module.dart';
import 'package:consulta_fipe/src/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        HomeModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module('/home', module: HomeModule());
    r.module('/auth', module: AuthModule());
  }
}
