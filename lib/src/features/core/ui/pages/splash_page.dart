import 'package:consulta_fipe/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:consulta_fipe/src/features/auth/interactor/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<AuthBloc>((bloc) => bloc.stream);
    bool isLogged = bloc.state is LoggedAuthState;
    // bool isUnlogged = bloc.state is LoggedAuthState;
    return Container();
    // if (isLogged) {
    //   Modular.to.navigate('/home/');
    // } else {
    //   Modular.to.navigate('/auth/login');
    // }
  }
}
