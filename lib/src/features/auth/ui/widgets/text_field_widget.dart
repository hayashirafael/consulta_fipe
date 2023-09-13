// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final bool? enabled;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? decorationLabelText;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool? obscureText;
  final String? errorText;

  const TextFieldWidget({
    Key? key,
    this.enabled,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.decorationLabelText,
    this.width,
    this.height,
    this.padding,
    this.obscureText,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: TextField(
              obscureText: obscureText ?? false,
              enabled: enabled ?? true,
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                errorText: errorText,
                prefixIcon: prefixIcon,
                focusColor: Colors.white,
                labelText: decorationLabelText,
                labelStyle: const TextStyle(
                  color: Colors.white60,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
