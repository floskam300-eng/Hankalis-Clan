import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  final String hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TextFormField(
      keyboardType: TextInputType.webSearch,
      controller: controller,
      style: TextStyle(fontSize: 14),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: TextStyle(color: theme.onPrimaryContainer, fontSize: 14),
        prefixIcon: prefixIcon,
        prefixIconColor: theme.onPrimaryContainer,
        constraints: BoxConstraints(),
        fillColor: theme.onPrimary,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: theme.onPrimaryContainer),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: theme.onPrimaryContainer),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: theme.onSecondaryContainer),
        ),
      ),
    );
  }
}
