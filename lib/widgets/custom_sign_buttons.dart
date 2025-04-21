import 'package:flutter/material.dart';

class CustomSignButtons extends StatelessWidget {
  const CustomSignButtons({
    super.key,
    required this.asset,
    required this.title,
    required this.onTap,
  });

  final String asset;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(asset, height: 25, width: 25),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
