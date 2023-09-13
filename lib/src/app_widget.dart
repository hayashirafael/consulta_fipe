import 'dart:async';

import 'package:consulta_fipe/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:consulta_fipe/src/features/auth/interactor/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = context.read<AuthBloc>().stream.listen((state) {
      if (state is LoggedAuthState) {
        print('passou');
        Modular.to.navigate('/home/');
      } else if (state is LogoutAuthState) {
        print('passou');
        Modular.to.navigate('/auth/login');
      } else {
        print('sss');
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth/login');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
