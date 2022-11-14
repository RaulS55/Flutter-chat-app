import 'package:chatapp/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {Key? key,
      required this.icon,
      required this.hint,
      this.obscureText = false,
      this.textInputAction,
      required this.textController,
      this.keyboardType})
      : super(key: key);
  final IconData icon;
  final String? hint;
  final bool obscureText;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      padding: const EdgeInsets.all(5).copyWith(right: 20),
      margin: EdgeInsets.only(bottom: responsive.hp(4)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 10),
                blurRadius: 5)
          ]),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(icon), border: InputBorder.none, hintText: hint),
      ),
    );
  }
}
