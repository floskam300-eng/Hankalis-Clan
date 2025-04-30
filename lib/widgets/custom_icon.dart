import "package:flutter/material.dart";

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onTap});

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: theme.onSecondary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.fromBorderSide(
              BorderSide(color: theme.onPrimaryContainer),
            ),
          ),
          child: Center(child: Icon(icon, color: theme.onSecondaryContainer)),
        ),
      ),
    );
  }
}
