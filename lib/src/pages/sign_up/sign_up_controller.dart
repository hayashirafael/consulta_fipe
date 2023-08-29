import 'package:flutter/material.dart';

class SignUpController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final String emailErrorText = '';
  final String passwordErrorText = '';
  final String nameErrorText = '';
  final bool cadastrando = false;
}
