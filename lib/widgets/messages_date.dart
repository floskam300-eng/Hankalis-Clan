import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessagesDate extends StatelessWidget {
  const MessagesDate({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(child: Divider(color: theme.onPrimaryContainer)),
          SizedBox(width: 10),
          Bubble(
            color: theme.onPrimaryContainer,
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.0),
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: Divider(color: theme.onPrimaryContainer)),
        ],
      ),
    );
  }
}
