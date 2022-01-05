import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
