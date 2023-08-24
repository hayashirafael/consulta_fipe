import 'package:consulta_fipe/src/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseService firebaseService;

  @override
  Widget build(BuildContext context) {
    firebaseService = context.read<FirebaseService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(firebaseService.userCredential?.user?.email ?? 'NO'),
      ),
      body: Container(),
    );
  }
}
