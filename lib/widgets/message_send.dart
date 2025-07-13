import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessageSend extends StatelessWidget {
  const MessageSend({super.key, required this.time, required this.message});

  final String time, message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 11.0, color: Colors.grey.shade600),
                ),
                SizedBox(width: 5),
                Icon(Icons.done_all, color: Color(0xFF1B97F3), size: 15.0),
              ],
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              nip: BubbleNip.rightTop,
              color: theme.onTertiary,
              child: Text(
                message,
                textAlign: TextAlign.right,
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
