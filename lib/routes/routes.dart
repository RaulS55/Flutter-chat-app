// ignore_for_file: constant_identifier_names

import 'package:chatapp/iu/pages/chat/chat_page.dart';
import 'package:chatapp/iu/pages/login/loading_page.dart';
import 'package:chatapp/iu/pages/login_page.dart';
import 'package:chatapp/iu/pages/register/register_page.dart';
import 'package:chatapp/iu/pages/user/user_page.dart';
import 'package:flutter/cupertino.dart';

abstract class Pages {
  static const String INITIAL = Routes.USER;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.CHAT: (_) => const ChatPage(),
    Routes.LOADING: (_) => const LoadingPage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.REGISTER: (_) => const RegisterPage(),
    Routes.USER: (_) => const UserPage(),
  };
}

abstract class Routes {
  static const CHAT = "chat";
  static const LOADING = "loading";
  static const LOGIN = "login";
  static const REGISTER = "register";
  static const USER = "user";
}
