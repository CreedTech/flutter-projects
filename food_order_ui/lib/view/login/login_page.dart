import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/widgets/forgot_passwords.dart';
import 'package:food_order_ui/view/login/widgets/login_button.dart';
import 'package:food_order_ui/view/login/widgets/logo.dart';
import 'package:food_order_ui/view/login/widgets/text_field.dart';
import 'package:food_order_ui/view/login/widgets/text_sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            LogoImage(),
            LoginTextField(),
            ForgotPassword(),
            LoginButtonColor(),
            TextSignUp(),
          ],
        ),
      ),
    );
  }
}
