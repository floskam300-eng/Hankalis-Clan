import 'package:flutter/material.dart';


class MessageField extends StatelessWidget {
  const MessageField({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: "message",
        hintStyle: TextStyle(
          color: theme.onPrimaryContainer,
          fontSize: 14,
        ),
        prefixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.add_circle, color: theme.onSecondaryContainer),
        ),
        constraints: BoxConstraints(),
        fillColor: theme.onSecondary,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.onPrimaryContainer),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.onPrimaryContainer),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.onPrimaryContainer),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.onPrimaryContainer),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
