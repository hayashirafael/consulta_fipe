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
  late FirebaseService firebaseService;
  String _emailErrorText = '';
  String _passwordErrorText = '';
  String _nameErrorText = '';
  bool _cadastrando = false;

  void alterarStatusCadastro() async {
    setState(() {
      _cadastrando = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _cadastrando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showSuccessSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro bem-sucedido!'),
          backgroundColor: Colors.green,
        ),
      );
    }

    firebaseService = Provider.of<FirebaseService>(context);
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
                  decoration: InputDecoration(
                    errorText: _nameErrorText.isNotEmpty ? _nameErrorText : null,
                    prefixIcon: const Icon(Icons.person_2_outlined, size: 35),
                    focusColor: Colors.white,
                    labelText: 'Nome',
                    labelStyle: const TextStyle(
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
                  decoration: InputDecoration(
                    errorText: _emailErrorText.isNotEmpty ? _emailErrorText : null,
                    prefixIcon: const Icon(Icons.email_outlined, size: 35),
                    focusColor: Colors.white,
                    labelText: 'Email',
                    labelStyle: const TextStyle(
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
                  decoration: InputDecoration(
                    errorText: _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
                    prefixIcon: const Icon(Icons.lock_outline, size: 35),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _cadastrando
                        ? null
                        : () async {
                            alterarStatusCadastro();
                            FocusManager.instance.primaryFocus?.unfocus();
                            final name = _nameController.text;
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            if (name.isEmpty) {
                              setState(() {
                                _nameErrorText = 'Campo obrigatório';
                              });
                              return;
                            } else if (name.length < 3) {
                              setState(() {
                                _nameErrorText = 'Campo nome deve conter no mínimo 3 letras';
                              });
                              return;
                            } else if (email.isEmpty) {
                              setState(() {
                                _emailErrorText = 'Campo obrigatório';
                              });
                              return;
                            } else if (password.isEmpty) {
                              setState(() {
                                _passwordErrorText = 'Campo obrigatório';
                              });
                              return;
                            }
                            final cadastro = await firebaseService.createUserWithEmailAndPassword(
                              name: name,
                              email: email,
                              password: password,
                            );

                            switch (cadastro) {
                              case 'email-already-in-use':
                                setState(() {
                                  _emailErrorText = 'Esse email já existe';
                                });
                                break;
                              case 'invalid-email':
                                setState(() {
                                  _emailErrorText = 'Email inválido';
                                });
                                break;
                              case 'weak-password':
                                setState(() {
                                  _passwordErrorText = 'A senha deve ter no mínimo 6 digitos';
                                });
                                break;
                              default:
                                {
                                  _showSuccessSnackBar();
                                  await Future.delayed(const Duration(seconds: 1));
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                }
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
                const SizedBox(height: 30),
                SizedBox(
                  width: 180,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Já tem uma conta? Faça login',
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
