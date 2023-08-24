import 'package:consulta_fipe/src/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebase = context.watch<FirebaseService>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 23, 58),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child: Image.asset(
                  'assets/images/carro_novo_logo.png',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Cadastro',
                style: GoogleFonts.quicksand(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2_outlined, size: 35),
                  focusColor: Colors.white,
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, size: 35),
                  focusColor: Colors.white,
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _passwordController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, size: 35),
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    firebase.cadastrarUsuario(
                      name: name,
                      email: email,
                      password: password,
                    );
                    if (firebase.error == 'email-already-in-use') {
                      const snackBar = SnackBar(
                        content: Text('Email já está em uso'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    // foregroundColor: const Color.fromARGB(255, 28, 184, 54),
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Text(
                    'Cadastrar',
                    style: GoogleFonts.openSans(
                      fontSize: 25,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
