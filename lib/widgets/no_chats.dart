import 'package:flutter/material.dart';

class NoChats extends StatelessWidget {
  const NoChats({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No chats opend.",
              style: TextStyle(
                color: theme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              "choose chat from the right side.",
              style: TextStyle(
                color: theme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
