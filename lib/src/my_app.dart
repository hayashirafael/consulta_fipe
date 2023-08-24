import 'package:consulta_fipe/src/pages/signIn_page.dart';
import 'package:consulta_fipe/src/pages/signUp_page.dart';
import 'package:consulta_fipe/src/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirebaseService(firebaseAuth: FirebaseAuth.instance),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SignInPage(),
          '/signUp': (context) => const SignUpPage(),
        },
      ),
    );
  }
}
