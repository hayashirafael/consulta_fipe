import 'package:consulta_fipe/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:consulta_fipe/src/features/auth/interactor/events/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastrado com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<AuthBloc>((bloc) => bloc.stream);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 23, 58),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Cadastro',
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 60),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    // errorText: _nameErrorText.isNotEmpty ? _nameErrorText : null,
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
                    // errorText: _emailErrorText.isNotEmpty ? _emailErrorText : null,
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
                    // errorText: _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
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
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      String name = _nameController.text;
                      bloc.add(RegisterAuthEvent(
                        name: name,
                        email: email,
                        password: password,
                      ));
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
                const SizedBox(height: 30),
                SizedBox(
                  width: 180,
                  child: InkWell(
                    onTap: () => Modular.to.navigate('/auth/login'),
                    child: Text(
                      'Já tem uma conta? Faça login',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
