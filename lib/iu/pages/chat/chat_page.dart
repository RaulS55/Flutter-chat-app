import 'dart:io';

import 'package:chatapp/data/models/chat_message.dart';
import 'package:chatapp/iu/pages/chat/buble_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final textController = TextEditingController();
  final _focusNode = FocusNode();
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              child: Text("Me", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue[400],
            ),
            SizedBox(width: 5),
            Text(
              "Melisa Flores",
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return BubbleMessage(
                      chat: messages[index],
                    );
                  },
                ),
              ),
              const Divider(),
              textBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget textBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
          child: Row(
        children: [
          Flexible(
              child: TextField(
            focusNode: _focusNode,
            onChanged: (value) {
              setState(() {
                _text = value;
              });
            },
            onSubmitted: _handleSubmit,
            controller: textController,
            decoration:
                const InputDecoration.collapsed(hintText: "Enviar mensaje..."),
          )),
          //Boton de enviar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isIOS
                ? CupertinoButton(child: const Text("Enviar"), onPressed: () {})
                : IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                        splashRadius: 25,
                        onPressed: _text.trim() == ""
                            ? null
                            : () => _handleSubmit(_text.trim()),
                        icon: const Icon(
                          Icons.send,
                        )),
                  ),
          )
        ],
      )),
    );
  }

  _handleSubmit(String text) {
    _focusNode.requestFocus();
    textController.clear();
    final newMessage = ChatMessage(
        "123",
        text,
        AnimationController(
            vsync: this, duration: Duration(milliseconds: 500)));
    messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _text = "";
    });
  }

  @override
  void dispose() {
    //Off sockets
    for (ChatMessage message in messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

final messages = [
  /* ChatMessage("123", "Hola mundo"),
  ChatMessage("123aa", "Hola mundo"),
  ChatMessage("123", "Hola mundoaaaaaaaaaaaaaaaaaaaaaaaaa"),
  ChatMessage("123aa", "Hola mundo como estas??"),
  ChatMessage("123", "Hola mundo "),*/
];
