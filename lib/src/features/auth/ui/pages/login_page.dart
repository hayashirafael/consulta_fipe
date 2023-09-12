import 'package:consulta_fipe/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:consulta_fipe/src/features/auth/interactor/events/auth_event.dart';
import 'package:consulta_fipe/src/features/auth/interactor/states/auth_state.dart';
import 'package:consulta_fipe/src/features/auth/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>((bloc) => bloc.stream);
    final AuthState state = bloc.state;
    bool isLoading = state is LoadingAuthState;
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
                  'assets/images/carro_logo.png',
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
              TextFieldWidget(
                enabled: !isLoading,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decorationLabelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined, size: 35),
              ),
              TextFieldWidget(
                enabled: !isLoading,
                controller: _passwordController,
                decorationLabelText: 'Password',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock_outline, size: 35),
              ),
              const Text(
                'Esqueceu a senha?',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              if (!isLoading)
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
                      FocusManager.instance.primaryFocus?.unfocus();
                      final String email = _emailController.text;
                      final String password = _passwordController.text;
                      final LoginAuthEvent event = LoginAuthEvent(
                        email: email,
                        password: password,
                      );
                      bloc.add(event);
                    },
                  ),
                ),
              if (isLoading) const CircularProgressIndicator(),
              const Spacer(),
              Text(
                'Não tem uma conta?',
                style: GoogleFonts.openSans(
                  color: Colors.white.withOpacity(.5),
                  fontSize: 13,
                ),
              ),
              InkWell(
                onTap: () => Modular.to.navigate('/auth/register'),
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
