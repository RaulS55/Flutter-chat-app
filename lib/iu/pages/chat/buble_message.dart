import 'package:chatapp/data/models/chat_message.dart';
import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final ChatMessage chat;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: chat.animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: chat.animationController, curve: Curves.easeInOut),
        child: Container(
            child: chat.idUser == "123"
                ? MyBubble(text: chat.text)
                : OtherBubble(text: chat.text)),
      ),
    );
  }
}

class MyBubble extends StatelessWidget {
  const MyBubble({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(5).copyWith(left: 50),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(text),
      ),
    );
  }
}

class OtherBubble extends StatelessWidget {
  const OtherBubble({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(5).copyWith(right: 50),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(text),
      ),
    );
  }
}
