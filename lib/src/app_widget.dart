import 'package:consulta_fipe/src/features/auth/data/services/firebase_auth_service.dart';
import 'package:consulta_fipe/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:consulta_fipe/src/features/auth/ui/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(FirebaseAuthService(FirebaseAuth.instance))),
        ],
        child: const LoginPage(),
      ),
    );
  }
}
