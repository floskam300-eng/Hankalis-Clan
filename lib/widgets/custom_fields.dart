import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hankalis_clan/controller/authentication_controller.dart';

class CustomFields extends StatelessWidget {
  const CustomFields({
    super.key,
    required this.title,
    required this.inputType,
    required this.icon,
    this.validator,
    this.controller,
  });

  final String title;
  final TextInputType inputType;
  final Icon icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GetBuilder<AuthenticationController>(
      builder: (controller) => TextFormField(
        keyboardType: inputType,
        obscureText: inputType == TextInputType.visiblePassword ? controller.getIsVisible : false,
        validator: validator ?? (p0) => null,
        controller: this.controller ?? TextEditingController(),
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: title,
          suffixIcon: inputType == TextInputType.visiblePassword ? IconButton(onPressed: () {
            controller.isVisible = !controller.getIsVisible;
          }, icon: Icon(controller.getIsVisible ? Icons.visibility_off : Icons.visibility)) : null,
          suffixIconColor: theme.onPrimaryContainer,
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
      ),
    );
  }
}
