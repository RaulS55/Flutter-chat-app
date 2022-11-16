import 'package:flutter/animation.dart';

class ChatMessage {
  final String idUser, text;
  final AnimationController animationController;

  ChatMessage(this.idUser, this.text, this.animationController);
}
