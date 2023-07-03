import 'package:flutter/material.dart';
import 'package:food_order_ui/view/register/widget/background_image.dart';
import 'package:food_order_ui/view/register/widget/register_button.dart';
import 'package:food_order_ui/view/register/widget/text_field.dart';
import 'package:food_order_ui/view/register/widget/text_signin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            BackgroundImage(),
            RegisterTextField(),
            RegisterButton(),
            TextSignIn(),
          ],
        ),
      ),
    );
  }
}
