import 'package:chatapp/routes/routes.dart';
import 'package:chatapp/utils/responsive.dart';
import 'package:chatapp/iu/widgets/custom.input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
            child: Container(
          color: Colors.transparent,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: responsive.hp(8)),
                const _Logo(),
                SizedBox(height: responsive.hp(8)),
                const _Form(),
                SizedBox(height: responsive.hp(8)),
                const _Labels(),
                SizedBox(height: responsive.hp(8)),
                const Text("Terminos y condiciones de uso"),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/tag-logo.png", width: responsive.wp(45)),
          Text(
            "Messenger",
            style: TextStyle(fontSize: responsive.dp(4)),
          )
        ],
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
      child: Column(
        children: [
          CustomInput(
              icon: Icons.email,
              hint: "Email",
              keyboardType: TextInputType.emailAddress,
              textController: emailController),
          CustomInput(
              icon: Icons.lock,
              hint: "Password",
              keyboardType: TextInputType.visiblePassword,
              textController: passwordController),
          CupertinoButton(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue,
              child: Text(
                "Siguiente",
                style: TextStyle(fontSize: responsive.dp(2.2)),
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Column(
      children: [
        Text(
          "¿No tienes cuenta?",
          style: TextStyle(color: Colors.grey, fontSize: responsive.dp(1.8)),
        ),
        SizedBox(height: responsive.hp(1)),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.REGISTER),
          child: Text("Crea una ahora",
              style: TextStyle(color: Colors.blue, fontSize: responsive.dp(2))),
        )
      ],
    );
  }
}
