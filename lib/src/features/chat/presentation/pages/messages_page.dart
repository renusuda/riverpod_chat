import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    required this.conversationId,
    super.key,
  });

  final String conversationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(child: Text(conversationId)),
    );
  }
}
