import 'package:consulta_fipe/src/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late FirebaseService firebaseService;
  bool _cadastrando = false;
  String _emailErrorText = '';
  String _passwordErrorText = '';

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
    firebaseService = context.read<FirebaseService>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 23, 58),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 150,
                child: Image.asset(
                  'assets/images/carro_novo_logo.png',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'consulta',
                    style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'FIPE',
                    style: GoogleFonts.quicksand(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
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
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, size: 35),
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Esqueceu a senha?',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // foregroundColor: const Color.fromARGB(255, 28, 184, 54),
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Text(
                    'Entrar',
                    style: GoogleFonts.openSans(
                      fontSize: 25,
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      _cadastrando = true;
                    });
                    FocusManager.instance.primaryFocus?.unfocus();
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    if (email.isEmpty || password.isEmpty) {
                      if (email.isEmpty) {
                        setState(() {
                          _emailErrorText = 'Campo obrigatório';
                        });
                      } else if (password.isEmpty) {
                        setState(() {
                          _passwordErrorText = 'Campo obrigatório';
                        });
                      }
                      setState(() {
                        _cadastrando = false;
                      });

                      return;
                    }

                    final register = await firebaseService.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    switch (register) {
                      case 'email-already-in-use':
                        setState(() {
                          _emailErrorText = 'Esse email já existe';
                        });
                      case 'invalid-email':
                        setState(() {
                          _emailErrorText = 'Email inválido';
                        });
                      case 'weak-password':
                        setState(() {
                          _passwordErrorText = 'A senha deve ter no mínimo 6 digitos';
                        });
                      default:
                        {
                          _showSuccessSnackBar();
                          if (context.mounted) Navigator.pop(context);
                        }
                    }
                    setState(() {
                      _cadastrando = false;
                    });
                  },
                ),
              ),
              const Spacer(),
              Text(
                'Não tem uma conta?',
                style: GoogleFonts.openSans(
                  color: Colors.white.withOpacity(.5),
                  fontSize: 13,
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/signUp'),
                child: Text(
                  'Criar conta',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
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
