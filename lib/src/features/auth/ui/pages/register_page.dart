import 'package:consulta_fipe/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:consulta_fipe/src/features/auth/interactor/events/auth_event.dart';
import 'package:consulta_fipe/src/features/auth/interactor/states/auth_state.dart';
import 'package:consulta_fipe/src/features/auth/ui/widgets/text_field_widget.dart';
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
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<AuthBloc>((bloc) => bloc.stream);
    AuthState state = bloc.state;
    bool isLoading = state is LoadingAuthState;
    bool isError = state is ErrorAuthState;

    return Scaffold(
      // key: _scaffoldKey,
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
                TextFieldWidget(
                  enabled: !isLoading,
                  controller: _nameController,
                  errorText: isError ? state.nameError : null,
                  keyboardType: TextInputType.name,
                  decorationLabelText: 'Nome',
                  prefixIcon: const Icon(Icons.person_2_outlined, size: 35),
                ),
                TextFieldWidget(
                  enabled: !isLoading,
                  controller: _emailController,
                  keyboardType: TextInputType.name,
                  decorationLabelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined, size: 35),
                  errorText: isError ? state.emailError : null,
                ),
                TextFieldWidget(
                  enabled: !isLoading,
                  obscureText: true,
                  controller: _passwordController,
                  keyboardType: TextInputType.name,
                  decorationLabelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline, size: 35),
                  errorText: isError ? state.passwordError : null,
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
                if (isLoading) const CircularProgressIndicator(),
                if (!isLoading)
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
                StreamBuilder(
                  stream: bloc.stream,
                  builder: (context, snapshot) {
                    if (snapshot.data is SuccessfulRegistrationAuthState) {
                      _showSuccessSnackBar();
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessSnackBar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastrado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }
}
