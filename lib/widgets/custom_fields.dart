import 'package:flutter/material.dart';

class CustomFields extends StatelessWidget {
  const CustomFields({
    super.key,
    required this.title,
    required this.inputType,
    required this.icon,
    this.obscureText,
    this.validator,
    this.controller,
  });

  final String title;
  final TextInputType inputType;
  final bool? obscureText;
  final Icon icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: theme.onPrimaryContainer, fontSize: 14),
        prefixIcon: icon,
        prefixIconColor: theme.onPrimaryContainer,
        constraints: BoxConstraints(),
        fillColor: theme.onPrimary,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
