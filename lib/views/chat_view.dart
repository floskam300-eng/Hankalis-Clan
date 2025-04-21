import 'package:flutter/material.dart';
import 'package:hankalis_clan/screens/chats.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(10.0), child: Chats()),
    );
  }
}
