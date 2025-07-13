import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessageReceive extends StatelessWidget {
  const MessageReceive({super.key, required this.time, required this.message});

  final String time, message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 11.0, color: Colors.grey.shade600),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              color: theme.onPrimaryContainer,
              nip: BubbleNip.leftTop,
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
